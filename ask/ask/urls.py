from django.conf.urls import url, include                                       
from django.contrib import admin                                                
admin.autodiscover()                                                            
                                                                                
urlpatterns = [                                                                 
   url(r'^$', include('ask.qa.views') ),                   
   url(r'^login/.*$', include('ask.qa.views'), name='login'),                  
   url(r'^signup/.*', include('ask.qa.views'), name='signup'),
   url(r'^question/(?P<id>[0-9]+)/$', include('ask.qa.views'), name='question'),                        
   url(r'^ask/.*', include('ask.qa.views'), name='ask'),                                                                             
   url(r'^popular/.*', include('ask.qa.views'), name='popular'),
   url(r'^new/.*', include('ask.qa.views'), name='new'),                                                                                                  
]     
