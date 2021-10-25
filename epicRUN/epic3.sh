set -x; 
echo "This is a shell script"
cd /..
cd home/dmit
cd warehouse
source newenv/bin/activate
cd warehouse
celery -A tasks worker --loglevel=INFO
exec bash
