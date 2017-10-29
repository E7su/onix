#!/bin/bash
sudo /etc/init.d/nginx start
ps -o pid,euser,egroup,comm,args -C nginx

mkdir -p /home/box/web/public/img
mkdir -p /home/box/web/public/css
mkdir -p /home/box/web/public/js
mkdir -p /home/box/web/uploads
mkdir -p /home/box/web/etc

sudo unlink /etc/nginx/sites-enabled/default
cp /etc/nginx/nginx.conf /home/box/web/etc
sudo /etc/init.d/nginx restart
