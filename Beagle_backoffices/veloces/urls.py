from django.urls import path,include
from . import views
app_name='veloces'
urlpatterns = [
    path('',views.home,name='home'),
    
        
]