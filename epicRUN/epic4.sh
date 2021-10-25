set -x; 
echo "This is a shell script"

export SECRET_KEY="really-secret-keyyyyyyyyyyyddddd"
export USER="user_name"
export PASSWORD="password"
export SHOP_CELERY_BROKER="redis://localhost:6379/0"
export WAREHOUSE_USER_TOKEN="Token 612a78cc5ed5aea70121d460d0c153d16cab20e3"
export WAREHOUSE_URL="http://0.0.0.0:5000/api/order/create/"


cd /..
cd home/dmit
cd shop
source newenv/bin/activate
cd shop
celery -A tasks worker --loglevel=INFO
exec bash
