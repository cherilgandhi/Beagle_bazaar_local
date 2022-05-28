from django.db import models
from django.contrib.auth.models import User
from backoffice import validators
from backoffice import enums
from django import forms


class UserCredentials(models.Model):
    user = models.OneToOneField(User, models.CASCADE)
    user_type = models.SmallIntegerField(choices=enums.to_choices(enums.AccountTypes))
    
    def __str__(self):
        return self.user.username
    