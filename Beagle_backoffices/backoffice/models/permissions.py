from email.policy import default
from django.db import models
from django.contrib.auth.models import User

# class BackofficePermissionType:


class BackofficePermission(models.Model):
    user = models.OneToOneField(User, models.CASCADE)

    # product related
    product_view = models.BooleanField(default=False)
    product_create = models.BooleanField(default=False)
    product_delete = models.BooleanField(default=False)
    product_update = models.BooleanField(default=False)
    
    #category related
    category_view = models.BooleanField(default=False)
    category_create = models.BooleanField(default=False)
    category_delete = models.BooleanField(default=False)
    category_update = models.BooleanField(default=False)

    #subcategory related
    subcategory_view = models.BooleanField(default=False)
    subcategory_create = models.BooleanField(default=False)
    subcategory_delete = models.BooleanField(default=False)
    subcategory_update = models.BooleanField(default=False)

    #order related
    order_view = models.BooleanField(default=False)
    order_update = models.BooleanField(default=False)
    order_delete = models.BooleanField(default=False)
    
    #inquiry related
    self_inquiry_view= models.BooleanField(default=False)
    all_inquiry_view = models.BooleanField(default=False)
   #all_inquiry_delete= models.BooleanField(default=False)
   
   # protal users(networks) related
    # all profile portal user wise
    customer_profile_view=models.BooleanField(default=False)
    company_profile_view=models.BooleanField(default=False)
    distributors_profile_view=models.BooleanField(default=False)
    dealer_profile_view=models.BooleanField(default=False)
    serviceagent_profile_view=models.BooleanField(default=False)
    lender_profile_view=models.BooleanField(default=False)
    # all profile approve view 
    customer_profile_approve_view = models.BooleanField(default=False)
    company_profile_approve_view=models.BooleanField(default=False)
    distributors_profile_approve_view=models.BooleanField(default=False)
    dealer_profile_approve_view=models.BooleanField(default=False)
    serviceagent_profile_approve_view=models.BooleanField(default=False)
    lender_profile_approve_view=models.BooleanField(default=False)
    
    def __str__(self):
        return self.user.username




       


    