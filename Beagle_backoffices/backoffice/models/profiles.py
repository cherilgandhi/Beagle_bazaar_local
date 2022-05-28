from django.db import models
from django.contrib.auth.models import User
from backoffice import validators
from backoffice import enums
from django import forms


class Profile(models.Model):
    user = models.OneToOneField(User, models.CASCADE)
    unit_number = models.CharField(max_length=100)
    street_address = models.CharField(max_length=100)
    tel_number = models.CharField(
        max_length=11,
        null=True,
        blank=True
    )
    pin_code = models.CharField(
        max_length=6,
        validators=[validators.pin_validator]
    )

    city = models.CharField(
        max_length=40
    )
    state = models.SmallIntegerField(
        choices=enums.to_choices(enums.IndiaStates)
    )
    user_position = models.CharField(
        max_length=40,
        default=""
    )
    def __str__(self):
        return self.user.email
    


