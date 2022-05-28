from django.db import models
from django.contrib.auth.models import User
from bizcred.modules.auth_user import AuthUser 

    
class LevelEmail(models.Model):
    user = models.ForeignKey(AuthUser, on_delete=models.CASCADE)
    level = models.SmallIntegerField()
    is_approved = models.BooleanField(default=False)
    sent_time = models.DateTimeField(auto_now_add=True, blank=False)

    # class Meta:
    #     db_table = 'Level_Completion_Email'
    def __str__(self):
        return self.user.username
