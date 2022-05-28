from django.db import models
from bizcred import enums
from bizcred.modules.auth_user import AuthUser 


class VeloceScore(models.Model):

    veloce_rating = models.SmallIntegerField(
        choices=enums.to_choices(enums.VeloceRating)
    )
    start = models.CharField(
        max_length=10
    )

    end = models.CharField(
        max_length=10
    )
    def __str__(self):
        return self.start
