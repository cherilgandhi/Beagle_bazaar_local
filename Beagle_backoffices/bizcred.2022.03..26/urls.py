from django.urls import path,include
from . import views

app_name = 'bizcred'
urlpatterns = [
    path('',views.home,name="home"),
]