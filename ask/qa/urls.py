from django.conf.urls import include, url, patterns
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns(
url(r'^$', views.test),
url(r'^login/', views.test, name='qa-login'),
url(r'^signup/', views.test, name='qa-signup'),
url(r'^question/(?P<id>[0-9]+)/$', views.test, name='qa-question'),
url(r'^ask', views.test, name='qa-ask'),
url(r'^popular', views.test, name='qa-popular'),
url(r'^new', views.test, name='qa-new'),
)
