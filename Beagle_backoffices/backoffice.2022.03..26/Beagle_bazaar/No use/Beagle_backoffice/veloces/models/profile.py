from django.db import models
from django.contrib.auth.models import User
from veloces.models import AuthUser # this is of the finance authuser
from veloces import validators
from veloces import enums
from veloces.models.helpers import UploadPath


class Profile(models.Model):
    MIN_LEVEL = 3

    user = models.OneToOneField(AuthUser, models.CASCADE)
    account_type = models.SmallIntegerField(default=0)
    is_complete = models.BooleanField(default=False)
    is_verified = models.BooleanField(default=False)
    completion_level = models.SmallIntegerField(default=-1)
    verification_level = models.SmallIntegerField(default=-1)

    def __str__(self):
        return self.user.email
    
    class Meta:
        managed = False # warning labels
        db_table = 'veloce_profile'
        
        


class GeneralInfo(models.Model):
    veloce_user = models.OneToOneField(AuthUser, on_delete=models.CASCADE)

    marital_status = models.SmallIntegerField(
        choices=enums.to_choices(enums.MaritalStatus)
    )
    dependents = models.SmallIntegerField()

    net_monthly_income = models.SmallIntegerField(
        choices=enums.to_choices(enums.MonthlyIncome)
    )
    education_level = models.SmallIntegerField(
        choices=enums.to_choices(enums.EducationLevel)
    )
    
    class Meta:
        # managed = False
        db_table = 'veloce_generalinfo'
    


class EmploymentInfo(models.Model):
    veloce_user = models.OneToOneField(AuthUser, on_delete=models.CASCADE)

    employment_type = models.SmallIntegerField(
        choices=enums.to_choices(enums.EmploymentType)
    )
    employment_industry = models.SmallIntegerField(
        choices=enums.to_choices(enums.EmploymentIndustry)
    )
    company_name = models.CharField(max_length=50)
    designation = models.CharField(max_length=50)
    time_at_current_company = models.SmallIntegerField(
        choices=enums.to_choices(enums.EmploymentDuration)
    )
    total_work_experience = models.SmallIntegerField(
        choices=enums.to_choices(enums.EmploymentDuration)
    )
    
    class Meta:
        # managed = False
        db_table = 'veloce_employmentinfo'



class InstitutionInfo(models.Model):
    veloce_user = models.OneToOneField(AuthUser, on_delete=models.CASCADE)

    company_name = models.CharField(
        max_length=50
    )
    # company_industry = models.SmallIntegerField(
    #     choices=enums.to_choices(enums.EmploymentIndustry),
    #     null=True,
    #     blank=True
    # )
    company_age = models.SmallIntegerField(
        choices=enums.to_choices(enums.EmploymentDuration)
    )
    gross_annual_turnover = models.SmallIntegerField(
        choices=enums.to_choices(enums.GrossTurnover)
    )

    gst_number = models.CharField(
        max_length=30,
    )
    gst_proof = models.FileField(
        upload_to=UploadPath('gst_proof'),
        validators=[validators.FileValidator]
    )
    firm_pan = models.CharField(
        max_length=10,
        validators=[validators.PanValidator]
    )
    pan_card_proof = models.FileField(
        upload_to=UploadPath('pan_card'),
    )
    
    class Meta:
        # managed = False
        db_table = 'veloce_instutioninfo'


class KycDocuments(models.Model):
    veloce_user = models.OneToOneField(AuthUser, on_delete=models.CASCADE)

    aadhar_number = models.CharField(
        max_length=12,
        validators=[validators.AadharValidator]
    )
    aadhar_card = models.FileField(
        upload_to=UploadPath('aadhar_card'),
        validators=[validators.FileValidator]
    )
    pan_number = models.CharField(
        max_length=10,
        unique=True,
        validators=[validators.PanValidator]
    )
    pan_card = models.FileField(
        upload_to=UploadPath('pan_card'),
    )
    
    class Meta:
        # managed = False
        db_table = 'veloce_kycdocuments'


class Address(models.Model):
    veloce_user = models.ForeignKey(AuthUser, on_delete=models.CASCADE)
    address_type = models.SmallIntegerField(
        choices=enums.to_choices(enums.AddressType),
        default=enums.AddressType.CURRENT.value
    )

    house_type = models.SmallIntegerField(
        choices=enums.to_choices(enums.HouseType)
    )
    unit_number = models.CharField(
        verbose_name="Floor/Unit #",
        max_length=30,
        null=True, blank=True
    )
    street_address = models.CharField(
        max_length=30
    )
    state = models.SmallIntegerField(
        choices=enums.to_choices(enums.IndiaStates)
    )
    city = models.CharField(
        max_length=40
    )
    pin_code = models.CharField(
        max_length=6,
        validators=[validators.PinCodeValidator]
    )
    effective_since = models.DateField()
    proof = models.FileField(
        upload_to=UploadPath('address_proof'),
    )
    
    class Meta:
        # managed = False
        db_table = 'veloce_address'


individual_borrower_models = {
    1: GeneralInfo,
    2: EmploymentInfo,
    3: Address,
    4: Address,
    5: KycDocuments,
}

individual_lender_models = {
    1: Address,
    2: Address,
    3: KycDocuments,
}

institutional_lender_models = {
    1: InstitutionInfo,
    2: Address,
}


def get_profile_models(account_type):
    if enums.AccountType.INDIVIDUAL_BORROWER.value == account_type:
        return individual_borrower_models
    if enums.AccountType.INDIVIDUAL_LENDER.value == account_type:
        return individual_lender_models
    if enums.AccountType.INSTITUTIONAL_LENDER.value == account_type:
        return institutional_lender_models


def get_profile_instance(user, step):
    profile_models = get_profile_models(user.metadata.account_type)
    model = profile_models[step]
    items = model.objects.filter(veloce_user__pk=user.pk)
    if model != Address:
        return items[0]
    elif profile_models.get(step - 1, None) != Address:
        return items.filter(address_type=enums.AddressType.CURRENT.value)[0]
    else:
        items = items.filter(address_type=enums.AddressType.PERMANENT.value)
        return items[0] if len(items) else None


