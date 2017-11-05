#!/bin/bash

sudo /etc/init.d/nginx start
ps -o pid,euser,egroup,comm,args -C nginx
  
mkdir -p /home/box/web/public/img
mkdir -p /home/box/web/public/css
mkdir -p /home/box/web/public/js
mkdir -p /home/box/web/uploads
mkdir -p /home/box/web/etc
mkdir -p /home/box/etc

# copy nginx config                                                             
cp etc/nginx.conf  /home/box/web/etc/nginx.conf                                 
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default      
sudo /etc/init.d/nginx restart                                                  
                                                                                
# copy gunicorn config                                                          
cp wsgi/gunicorn.conf /home/box/web/etc/                                        
cp etc/gunicorn-django.conf /home/box/web/etc/                                  
sudo ln -s /home/box/etc/gunicorn.conf /etc/gunicorn.d/test                     
sudo ln -s /home/box/etc/gunicorn-django.conf /etc/gunicorn.d/gunicorn-django.co
nf                                                                              
                                                                                
# copy wsgi application                                                         
cp wsgi/hello.py /home/box/web/                                                 
cp -r ask/ /home/box/web/                                                       
sudo /etc/init.d/gunicorn restart                                               
sudo gunicorn -c gunicorn.conf -b 0.0.0.0:8080 hello:wsgi_application           
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf ask.qa:views
