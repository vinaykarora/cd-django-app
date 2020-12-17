#!/bin/sh     
sudo git pull origin master
sudo pip3 install -r requirements.txt
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic
echo yes
sudo docker-compose stop
sudo docker-compose up --build
sudo systemctl restart nginx
sudo systemctl restart gunicorn