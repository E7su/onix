from django.conf.urls import include, url                                       
from django.contrib import admin                                                
from ask.qa.views import test     


admin.autodiscover()                                                            
                                                                                
urlpatterns = [                                                                 
    url(r'^$', test),                                                           
]                                                                               
