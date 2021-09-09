from celery import Celery
from celery.schedules import crontab
import requests
import json
import os
from django.conf import settings
import logging

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "shop.settings")
app = Celery('tasks', broker=settings.SHOP_CELERY_BROKER)


@app.on_after_configure.connect
def setup_periodic_tasks(sender, **kwargs):
    sender.add_periodic_task(5.0, test.s(), name='send to warehouse every 5')


def prepare_data_for_warehouse(order_pk):
    from main.models import Order
    import main.const
    order = Order.objects.get(pk=order_pk)
    transfer_data = {}
    transfer_data['order_client'] = order.advuser.username
    transfer_data['order_pk'] = order.pk
    transfer_data['order_date'] = order.order_date
    transfer_data['order_productsets'] = {}

    for m in order.productset.all():
        x = m.pk
        transfer_data['order_productsets'][x] = {}
        transfer_data['order_productsets'][x]['username'] = m.advuser.username
        transfer_data['order_productsets'][x]['product_name'] = m.product.name
        transfer_data['order_productsets'][x]['product_count'] = m.product_count

    logger = logging.getLogger('django')
    logger.warning('transfer_data:')
    logger.warning(transfer_data)

    return transfer_data


@app.task
def test():
    from main.models import Order
    import main.const
    orders_to_push = Order.objects.filter(status=main.const.PROCESSING_ORDER)
    for m in orders_to_push:
        transfer_to_warehouse.delay(prepare_data_for_warehouse(m.pk), m.pk)


@app.task
def transfer_to_warehouse(data_to_transfer, order_pk):
    from main.models import Order
    import main.const

    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('GOT DATA:')
        logger.warning(data_to_transfer)

    headers = {'Authorization': settings.WAREHOUSE_USER_TOKEN}
    data_send = {'order_info': json.dumps(data_to_transfer['order_productsets'], ensure_ascii=False).encode('utf8'),
                 'order_date': data_to_transfer['order_date'],
                 'order_number': data_to_transfer['order_pk'],
                 'order_client': data_to_transfer['order_client'],
                 }

    r = requests.post(settings.WAREHOUSE_URL, data=data_send, headers=headers)

    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('request text:')
        logger.warning(r.text)

    order = Order.objects.get(pk=order_pk)
    order.status = main.const.ORDER_SENT_TO_WAREHOUSE
    order.save()
    return
