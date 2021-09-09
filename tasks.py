from celery import Celery
import requests
import json

app = Celery('tasks', broker='redis://localhost:6379/0')

@app.task
def add(x, y):
    return x + y

@app.task
def transfer_to_warehouse( data_to_transfer ):


    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('GOT DATA:')
        logger.warning(data_to_transfer)



    headers = {'Authorization': 'Token 612a78cc5ed5aea70121d460d0c153d16cab20e3'}
    data_send = {'order_info': json.dumps(data_to_transfer['order_productsets'],ensure_ascii=False).encode('utf8'),
               'order_date': data_to_transfer['order_date'],
               'order_number': data_to_transfer['order_pk'],
               'order_client': data_to_transfer['order_client'],
              }



    r = requests.post('http://0.0.0.0:5000/api/order/create/', data=data_send, headers=headers)



    if settings.DEBUG == True:
        logger = logging.getLogger('django')
        logger.warning('request text:')
        logger.warning(r.text)

    return