set -x; 
echo "This is a shell script"
cd /..
cd home/dmit
cd warehouse
source newenv/bin/activate
cd warehouse
python3 manage.py runserver 0.0.0.0:5000
exec bash
