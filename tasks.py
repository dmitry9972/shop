from celery import Celery

app = Celery('tasks', broker='redis://localhost:6379/0')

@app.task
def add(x, y):
    return x + y

@app.task
def transfer_to_warehouse( data_to_transfer ):
    print('GOT DATA:')
    print(data_to_transfer)
    return