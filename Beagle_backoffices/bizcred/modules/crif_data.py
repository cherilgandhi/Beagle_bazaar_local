from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import JSONField
from bizcred.modules.auth_user import AuthUser 


class B2CReport(models.Model):
    user = models.OneToOneField(AuthUser, on_delete=models.CASCADE)
    orderid = models.IntegerField()
    data = JSONField()
    def __str__(self):
        return self.user.username
