from django.conf.urls import url, include                                       
from django.contrib import admin                                                
admin.autodiscover()                                                            
                                                                                
urlpatterns = [                                                                 
   url(r'^$', include('ask.qa.urls') ),                   
   url(r'^login/.*$', include('ask.qa.urls'), name='login'),                  
   url(r'^signup/.*', include('ask.qa.urls'), name='signup'),
   url(r'^question/(?P<id>[0-9]+)/$', include('ask.qa.urls'), name='question'),                        
   url(r'^ask/.*', include('ask.qa.urls'), name='ask'),                                                                             
   url(r'^popular/.*', include('ask.qa.urls'), name='popular'),
   url(r'^new/.*', include('ask.qa.urls'), name='new'),                                                                                                  
]     
