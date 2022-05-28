from django.contrib import admin
from bizcred import models
from bizcred.modules.veloce_score_master import VeloceScoreMasterForm

# Register your models here.

class VeloceScoreMasterAdmin(admin.ModelAdmin):
    form = VeloceScoreMasterForm

admin.site.register(models.auth_user.AuthUser)
admin.site.register(models.aadhar.Aadhar)
admin.site.register(models.additional_company_details.AdditionalCompanyDetails)
admin.site.register(models.address.Address)
admin.site.register(models.additional_company_details.AuthAdditionalCompanyDetails)
admin.site.register(models.bank_statement.BankStatement)
admin.site.register(models.bank.Bank)
admin.site.register(models.business_financial.BusinessFinancial)
admin.site.register(models.company_details.CompanyDetails)
admin.site.register(models.employment_details.EmploymentDetail)
admin.site.register(models.finance_offer_detail.FinanceOfferDetail)
admin.site.register(models.general.General)
admin.site.register(models.identification.Identification)
admin.site.register(models.itr.IncomeTaxReturn)
admin.site.register(models.bank.LenderDetails)
admin.site.register(models.level_email.LevelEmail)
admin.site.register(models.phone.Phone)
admin.site.register(models.metadata.Metadata)
admin.site.register(models.veloce_score.VeloceScore)
admin.site.register(models.veloce_score_master.VeloceScoreMaster, VeloceScoreMasterAdmin)
admin.site.register(models.related_company.RelatedCompanyInfo)
admin.site.register(models.sanctioned_loans.SanctionedLoan)
admin.site.register(models.v_score_approval_matrix.VeloceScoreApprovalMatrix)
# admin.site.register(models.address.Address)
# admin.site.register(models.address.Address)
# admin.site.register(models.financial_details.EmploymentType)
# admin.site.register(models.financial_details.SelfEmployedInfo)
# admin.site.register(models.financial_details.SalariedInfo)
admin.site.register(models.crif_data.B2CReport)