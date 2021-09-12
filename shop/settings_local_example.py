# SHOP_SECRET_KEY
SECRET_KEY = 'really-secret-key'
# SHOP_DATABASES
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'django_db',
        'USER': 'xxxxxxx',
        'PASSWORD': 'xxxxxxx',
        'HOST': '127.0.0.1',
        'PORT': 'xxxx',
    }
}

SHOP_CELERY_BROKER = 'redis://localhost:xxxx/x'

WAREHOUSE_USER_TOKEN = 'Token xxxxxxxxxxxxxxxxxxx'

WAREHOUSE_URL = 'http://0.0.0.0:5000/api/order/create/'

