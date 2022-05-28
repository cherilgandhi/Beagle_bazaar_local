from django.contrib import admin
from veloces import models
# Register your models here.

admin.site.register(models.AuthUser)
admin.site.register(models.Profile)


admin.site.register(models.ApplicationPaymentStatus)
admin.site.register(models.ReviewedVeloceApplication)
admin.site.register(models.GeneralVeloceMarkup)
admin.site.register(models.DealerSpecialVeloceMarkup)
admin.site.register(models.ApplicationSpecialVeloceMarkup)
admin.site.register(models.FinanceSchemeConfig)
admin.site.register(models.VeloceApplication)
admin.site.register(models.InvoiceStep1)
admin.site.register(models.ApplicationStep1)
admin.site.register(models.ApplicationStep2)
admin.site.register(models.Loan)
admin.site.register(models.Lender)