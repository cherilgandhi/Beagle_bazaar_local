from django.urls import path,include
from . import views

app_name = 'veloce'
urlpatterns = [
    path('',views.home,name="home"),
]