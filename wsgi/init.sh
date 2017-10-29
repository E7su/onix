#!/bin/bash
sudo /etc/init.d/nginx start
ps -o pid,euser,egroup,comm,args -C nginx

mkdir -p /home/box/web/public/img
mkdir -p /home/box/web/public/css
mkdir -p /home/box/web/public/js
mkdir -p /home/box/web/uploads
mkdir -p /home/box/web/etc

# copy nginx config
cp /home/box/onix/nginx/nginx.conf  /home/box/web/etc/nginx.conf
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

# copy gunicorn config
cp gunicorn.conf /home/box/etc/
ln -s /home/box/etc/gunicorn.conf /etc/gunicorn.d/hello.py

# copy wsgi application
cp hello.py /home/box/web/


