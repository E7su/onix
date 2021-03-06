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
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/gunicorn.conf                                                                                        
sudo ln -s /home/box/web/etc/gunicorn-django.conf /etc/gunicorn.d/gunicorn-django.conf                                                                          
                                                                                                                                                                                                                                                                                                     
# copy wsgi application                                                                                                                                         
cp -r wsgi /home/box/web/                                                                                                                                 
cp -r ask/ /home/box/web/                                                                                                                                       
#sudo /etc/init.d/gunicorn restart                                                                                                                              
#sudo gunicorn -c /home/box/web/etc/gunicorn.conf -b 0.0.0.0:8080 wsgi.hello:wsgi_application                                                                                           
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf -b 0.0.0.0:8000 ask.ask.wsgi:application
