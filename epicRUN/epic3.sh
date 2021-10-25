set -x; 
echo "This is a shell script"


export SECRET_KEY="django-insecure-(q0"
export WAREHOUSE_REDIS_BROKER="redis://localhost:6379/1"
export CDEK_REGISTER_URL="https://api.edu.cdek.ru/v2/oauth/token?parameters"
export CDEK_ORDERS_URL="https://api.edu.cdek.ru/v2/orders"
export SHOP_API_TOKEN="Token 8e58ec44038ab7947bfb07e55f2c6fd2ded2a311"
export SHOP_API_URL="http://127.0.0.1:8000/api/order/{}/"
export CDEK_LOGIN="EMscd6r9JnFiQ3bLoyjJY6eM78JrJceI"
export CDEK_PASSWORD="PjLZkKBHEiLK3YsjtNrt3TGNG0ahs3kG"



cd /..
cd home/dmit
cd warehouse
source newenv/bin/activate
cd warehouse
celery -A tasks worker --loglevel=INFO
exec bash
