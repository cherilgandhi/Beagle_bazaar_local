from django.contrib import admin
from backoffice import models
# Register your models here.
admin.site.register(models.UserCredentials)


class AdminProfile(admin.ModelAdmin):
    list_display = ('user','city','state','tel_number',)
    # list_filter = ('city','state','tel_number',)
    
admin.site.register(models.Profile,AdminProfile)
admin .site.register(models.BackofficePermission)


# from django.contrib import admin

# class YourModelAdmin(admin.ModelAdmin):
#     def get_queryset(self, request):
#         qs = super(MyModelAdmin, self).get_queryset(request)
#         return qs.filter(author=request.user)

# admin.site.register(YourModel, YourModelAdmin)

