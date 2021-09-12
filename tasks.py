from celery import Celery
import requests
import json
import os
from django.conf import settings
import logging

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "shop.settings")
app = Celery('tasks', broker=settings.SHOP_CELERY_BROKER)



# settings.WAREHOUSE_URL = 'http://0.0.0.0:5000/api/order/create/'

@app.task
def add(x, y):
    return x + y

@app.task
def transfer_to_warehouse( data_to_transfer ):


    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('GOT DATA:')
        logger.warning(data_to_transfer)



    headers = {'Authorization': settings.WAREHOUSE_USER_TOKEN}
    data_send = {'order_info': json.dumps(data_to_transfer['order_productsets'],ensure_ascii=False).encode('utf8'),
               'order_date': data_to_transfer['order_date'],
               'order_number': data_to_transfer['order_pk'],
               'order_client': data_to_transfer['order_client'],
              }



    r = requests.post(settings.WAREHOUSE_URL, data=data_send, headers=headers)



    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('request text:')
        logger.warning(r.text)

    return