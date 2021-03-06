# Generated by Django 3.0.4 on 2022-02-24 09:49

import django.contrib.postgres.fields.jsonb
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import upload_validator
import veloces.models.helpers


class Migration(migrations.Migration):

    dependencies = [
        ('veloces', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='FinanceSchemeConfig',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('interest_percentage', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
            ],
            options={
                'db_table': 'veloce_financeschemeconfig',
            },
        ),
        migrations.CreateModel(
            name='GeneralVeloceMarkup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('markup_percentage', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('markup_payment_by', models.CharField(choices=[('1', 'Borrower'), ('2', 'Lender')], default='1', max_length=1)),
            ],
            options={
                'db_table': 'veloce_generalvelocemarkup',
            },
        ),
        migrations.CreateModel(
            name='VeloceApplication',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('application_type', models.SmallIntegerField(choices=[(1, 'Invoice'), (2, 'Loan')], default=1)),
                ('inquiry_id', models.IntegerField(blank=True, null=True, unique=True)),
                ('is_reviewed', models.BooleanField(default=False)),
                ('is_approved', models.BooleanField(default=False)),
                ('is_rejected', models.BooleanField(default=False)),
                ('reject_reason', models.TextField(blank=True, default='')),
                ('current_step', models.SmallIntegerField(default=1)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('rejected_by', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='application_by', to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_veloceapplication',
                'unique_together': {('id', 'inquiry_id')},
            },
        ),
        migrations.CreateModel(
            name='ReviewedVeloceApplication',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_reviewed', models.BooleanField(default=False)),
                ('is_approved', models.BooleanField(default=False)),
                ('is_rejected', models.BooleanField(default=False)),
                ('reject_reason', models.TextField(blank=True, default='')),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('rejected_by', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
                ('reviewed_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='approved_by', to='veloces.AuthUser')),
                ('veloce_app', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.VeloceApplication')),
            ],
            options={
                'db_table': 'veloce_reviewedveloceapplication',
                'unique_together': {('veloce_app', 'reviewed_by')},
            },
        ),
        migrations.CreateModel(
            name='Loan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loan_amount', models.PositiveIntegerField(verbose_name='Requested Loan Amount')),
                ('sanctioned_loan_amount', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('disbursement_amount', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('dealer_scheme_roi', models.DecimalField(blank=True, decimal_places=2, max_digits=8, null=True)),
                ('dealer_scheme_emi', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True, verbose_name='Dealer Scheme EMI')),
                ('loan_tenure', models.SmallIntegerField(validators=[django.core.validators.MinValueValidator(1)], verbose_name='Loan Tenure (Months)')),
                ('interest_rate', models.DecimalField(decimal_places=2, max_digits=4, verbose_name='Annual Interest Rate (%)')),
                ('lender_amount_after_veloce_roi', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True, verbose_name='Lender Amount After Veloce Markup')),
                ('lender_roi_after_veloce_roi', models.DecimalField(blank=True, decimal_places=4, max_digits=8, null=True)),
                ('veloce_amount', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('veloce_roi', models.DecimalField(blank=True, decimal_places=2, max_digits=8, null=True)),
                ('is_accepted', models.BooleanField(default=False)),
                ('is_coaccepted', models.BooleanField(default=False)),
                ('created_at', models.DateField(auto_now=True)),
                ('accepted_at', models.DateField(auto_now=True)),
                ('app_reviewed_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='app_reviewed_by', to='veloces.ReviewedVeloceApplication')),
                ('application', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.VeloceApplication')),
            ],
            options={
                'db_table': 'veloce_loan',
                'unique_together': {('application', 'app_reviewed_by')},
            },
        ),
        migrations.CreateModel(
            name='Lender',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loan_amount', models.DecimalField(decimal_places=0, max_digits=7)),
                ('loan', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.Loan')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_lender',
            },
        ),
        migrations.CreateModel(
            name='KycDocuments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('aadhar_number', models.CharField(max_length=12, validators=[django.core.validators.RegexValidator(message='Aadhar No. should have exactly 12 digits.', regex='^[0-9]{12}$')])),
                ('aadhar_card', models.FileField(upload_to=veloces.models.helpers.UploadPath('aadhar_card'), validators=[upload_validator.FileTypeValidator(allowed_types=['application/pdf', 'image/jpeg', 'image/png'])])),
                ('pan_number', models.CharField(max_length=10, unique=True, validators=[django.core.validators.RegexValidator(message='Invalid PAN number.', regex='^[A-Z]{3}[PCHABGJLFT][A-Z][0-9]{4}[A-Z]$')])),
                ('pan_card', models.FileField(upload_to=veloces.models.helpers.UploadPath('pan_card'))),
                ('veloce_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_kycdocuments',
            },
        ),
        migrations.CreateModel(
            name='InvoiceStep1',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('invoice_amount', models.IntegerField()),
                ('downpayment_amount', models.IntegerField()),
                ('tenure', models.CharField(max_length=2, verbose_name='Loan Tenure (Months)')),
                ('invoice_proof', models.FileField(upload_to=veloces.models.helpers.UploadPath('invoice'), validators=[upload_validator.FileTypeValidator(allowed_types=['application/pdf', 'image/jpeg', 'image/png'])])),
                ('application', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.VeloceApplication')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_invoicestep1',
            },
        ),
        migrations.CreateModel(
            name='InstitutionInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_name', models.CharField(max_length=50)),
                ('company_age', models.SmallIntegerField(choices=[(1, 'Less Than 1 Year'), (2, 'Between 1 And 2 Years'), (3, 'Between 3 And 5 Years'), (4, 'Between 5 And 7 Years'), (5, 'Between 7 And 10 Years'), (6, 'Between 10 And 15 Years'), (7, 'Over 15 Years')])),
                ('gross_annual_turnover', models.SmallIntegerField(choices=[(1, 'Between 50 Lacs And 1 Crore'), (2, 'Between 1 Crore And 2 Crores'), (3, 'Between 2 Crores And 5 Crores'), (4, 'Between 5 Crores And 10 Crores'), (5, 'Between 10 Crores And 50 Crores'), (6, 'Above 50 Crore')])),
                ('gst_number', models.CharField(max_length=30)),
                ('gst_proof', models.FileField(upload_to=veloces.models.helpers.UploadPath('gst_proof'), validators=[upload_validator.FileTypeValidator(allowed_types=['application/pdf', 'image/jpeg', 'image/png'])])),
                ('firm_pan', models.CharField(max_length=10, validators=[django.core.validators.RegexValidator(message='Invalid PAN number.', regex='^[A-Z]{3}[PCHABGJLFT][A-Z][0-9]{4}[A-Z]$')])),
                ('pan_card_proof', models.FileField(upload_to=veloces.models.helpers.UploadPath('pan_card'))),
                ('veloce_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_instutioninfo',
            },
        ),
        migrations.CreateModel(
            name='GeneralInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('marital_status', models.SmallIntegerField(choices=[(1, 'Single'), (2, 'Married'), (3, 'Divorced'), (4, 'Widowed')])),
                ('dependents', models.SmallIntegerField()),
                ('net_monthly_income', models.SmallIntegerField(choices=[(1, 'Between 10k And 25k'), (2, 'Between 25k And 50k'), (3, 'Between 50k And 100k'), (4, 'Above 100k')])),
                ('education_level', models.SmallIntegerField(choices=[(1, 'High School'), (2, 'Diploma'), (3, 'Graduate'), (4, 'Post Graduate'), (5, 'Professional')])),
                ('veloce_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_generalinfo',
            },
        ),
        migrations.CreateModel(
            name='EmploymentInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employment_type', models.SmallIntegerField(choices=[(1, 'Salaried'), (2, 'Self Employeed'), (3, 'Retired')])),
                ('employment_industry', models.SmallIntegerField(choices=[(1, 'Agriculture / Forestry / Fishing'), (2, 'Metals And Minerals'), (3, 'Energy And Utilities'), (4, 'Construction - Industrial Facilities And Infrastructure'), (6, 'Aerospace And Defense'), (7, 'Automotive And Parts Mfg'), (8, 'Biotechnology / Pharmaceuticals'), (9, 'Chemicals / Petro - Chemicals'), (10, 'Consumer Packaged Goods Manufacturing'), (11, 'Electronics, Components, And Semiconductor Mfg'), (12, 'Manufacturing - Other'), (13, 'Printing And Publishing'), (14, 'Clothing And Textile Manufacturing'), (15, 'Wholesale Trade / Import - Export'), (17, 'Retail'), (18, 'Travel, Transportation And Tourism'), (19, 'Transport And Storage - Materials'), (20, 'Internet Services'), (21, 'Broadcasting, Music, And Film'), (22, 'Telecommunications Services'), (23, 'Banking'), (24, 'Insurance'), (26, 'Real Estate / Property Management'), (27, 'Rental Services'), (28, 'Accounting And Auditing Services'), (29, 'Advertising And Pr Services'), (30, 'Architectural And Design Services'), (31, 'Management Consulting Services'), (32, 'Computer Hardware'), (33, 'Computer Software'), (34, 'Legal Services'), (37, 'Waste Management'), (38, 'Education'), (39, 'Healthcare Services'), (42, 'Performing And Fine Arts'), (43, 'Sports And Physical Recreation'), (44, 'Hotels And Lodging'), (45, 'Restaurant / Food Services'), (46, 'Staffing / Employment Agencies'), (47, 'Nonprofit Charitable Organizations'), (48, 'Personal And Household Services'), (50, 'Government And Military'), (74, 'Security And Surveillance'), (75, 'Automotive Sales And Repair Services'), (76, 'Business Services - Other'), (77, 'Information Technology Services'), (78, 'Construction - Residential And Commercial / Office'), (79, 'Engineering Services'), (80, 'Entertainment Venues And Theaters'), (81, 'Financial Services'), (82, 'Food And Beverage Production'), (83, 'Marine Mfg And Services'), (84, 'Medical Devices And Supplies'), (85, 'Others')])),
                ('company_name', models.CharField(max_length=50)),
                ('designation', models.CharField(max_length=50)),
                ('time_at_current_company', models.SmallIntegerField(choices=[(1, 'Less Than 1 Year'), (2, 'Between 1 And 2 Years'), (3, 'Between 3 And 5 Years'), (4, 'Between 5 And 7 Years'), (5, 'Between 7 And 10 Years'), (6, 'Between 10 And 15 Years'), (7, 'Over 15 Years')])),
                ('total_work_experience', models.SmallIntegerField(choices=[(1, 'Less Than 1 Year'), (2, 'Between 1 And 2 Years'), (3, 'Between 3 And 5 Years'), (4, 'Between 5 And 7 Years'), (5, 'Between 7 And 10 Years'), (6, 'Between 10 And 15 Years'), (7, 'Over 15 Years')])),
                ('veloce_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_employmentinfo',
            },
        ),
        migrations.CreateModel(
            name='DealerSpecialVeloceMarkup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('markup_percentage', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('markup_payment_by', models.CharField(choices=[('1', 'Borrower'), ('2', 'Lender')], default='1', max_length=1)),
                ('dealer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='dealer', to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_dealerspecialvelocemarkup',
            },
        ),
        migrations.CreateModel(
            name='ApplicationStep2',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bank_account_number', models.CharField(max_length=25, validators=[django.core.validators.RegexValidator(message='BAN should have exactly 25 digits.', regex='^[0-9]{9,20}$')], verbose_name='Bank Account Number <small class=asterisk>*</small>')),
                ('ifsc_code', models.CharField(max_length=50, validators=[django.core.validators.RegexValidator(message='IFSC should be an 11-digit alphanumeric code.', regex='^[a-zA-Z0-9]{11}$')], verbose_name='IFSC code <small class=asterisk>*</small>')),
                ('bank_name', models.CharField(max_length=50, verbose_name='Bank Name <small class=asterisk>*</small>')),
                ('borrower_bank_account_number', models.CharField(max_length=25, validators=[django.core.validators.RegexValidator(message='BAN should have exactly 25 digits.', regex='^[0-9]{9,20}$')], verbose_name='Bank Account Number <small class=asterisk>*</small>')),
                ('borrower_ifsc_code', models.CharField(max_length=50, validators=[django.core.validators.RegexValidator(message='IFSC should be an 11-digit alphanumeric code.', regex='^[a-zA-Z0-9]{11}$')], verbose_name='IFSC code <small class=asterisk>*</small>')),
                ('borrower_bank_name', models.CharField(max_length=50, verbose_name='Bank Name <small class=asterisk>*</small>')),
                ('application', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.VeloceApplication')),
            ],
            options={
                'db_table': 'veloce_applicationstep2',
            },
        ),
        migrations.CreateModel(
            name='ApplicationStep1',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('borrower_email', models.CharField(blank=True, max_length=32, null=True, verbose_name='Borower Email <small class=asterisk>*</small>')),
                ('bill_no', models.CharField(blank=True, max_length=20, null=True, verbose_name='Bill No <small class=asterisk>*</small>')),
                ('bill_amount', models.PositiveIntegerField(blank=True, null=True, verbose_name='Total Bill Amount <small class=asterisk>*</small>')),
                ('bill_date', models.DateField(blank=True, null=True, verbose_name='Bill Date <small class=asterisk>*</small>')),
                ('billing_party_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='Billing Party Name <small class=asterisk>*</small>')),
                ('inquired_by', models.CharField(blank=True, max_length=50, null=True, verbose_name=' INQUIRED BY / Billing Party Email')),
                ('down_payment', models.DecimalField(blank=True, decimal_places=2, default=0, max_digits=12, null=True, verbose_name='Down Payment <small class=asterisk>*</small>')),
                ('required_loan_amount', models.DecimalField(decimal_places=2, max_digits=12, verbose_name='Require Loan Amount <small class=asterisk>*</small>')),
                ('loan_reason', models.SmallIntegerField(blank=True, choices=[(1, 'Wedding'), (2, 'Medical'), (3, 'Vehicle'), (4, 'Education'), (5, 'Furniture'), (6, 'Electronics'), (7, 'Business'), (0, 'Others')], null=True, verbose_name='Reason')),
                ('emi_on_past_finance', models.IntegerField(default=0, verbose_name='EMI On Past Finance Availed')),
                ('current_loan_emi', models.DecimalField(decimal_places=2, default=0, max_digits=12, verbose_name='Current Loan EMI <small class=asterisk>*</small>')),
                ('total_emi', models.DecimalField(decimal_places=2, default=0, max_digits=12, verbose_name='Total EMI <small class=asterisk>*</small>')),
                ('dealers_given_finance_scheme', models.CharField(blank=True, max_length=20, null=True, verbose_name='Finance Scheme')),
                ('application', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='veloces.VeloceApplication')),
                ('coborrower', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='coborrower', to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_applicationstep1',
            },
        ),
        migrations.CreateModel(
            name='ApplicationSpecialVeloceMarkup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('markup_percentage', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('markup_payment_by', models.CharField(choices=[('1', 'Borrower'), ('2', 'Lender')], default='1', max_length=1)),
                ('loan_application_no', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='loan_application_no', to='veloces.VeloceApplication')),
            ],
            options={
                'db_table': 'veloce_applicationspecialvelocemarkup',
            },
        ),
        migrations.CreateModel(
            name='ApplicationPaymentStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_info', django.contrib.postgres.fields.jsonb.JSONField()),
                ('payment_request_id', models.CharField(blank=True, max_length=255, null=True)),
                ('payment_id', models.CharField(blank=True, max_length=255, null=True)),
                ('application', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='app_fee', to='veloces.VeloceApplication')),
            ],
            options={
                'db_table': 'veloce_applicationpaymentstatus',
            },
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address_type', models.SmallIntegerField(choices=[(1, 'Current'), (2, 'Permanent')], default=1)),
                ('house_type', models.SmallIntegerField(choices=[(1, 'Owned By You'), (2, 'Owned By Parents'), (3, 'Rented')])),
                ('unit_number', models.CharField(blank=True, max_length=30, null=True, verbose_name='Floor/Unit #')),
                ('street_address', models.CharField(max_length=30)),
                ('state', models.SmallIntegerField(choices=[(1, 'Andhra Pradesh'), (2, 'Arunachal Pradesh'), (3, 'Assam'), (4, 'Bihar'), (5, 'Chandigarh'), (6, 'Chhattisgarh'), (7, 'Dadra And Nagar Haveli'), (8, 'Daman And Diu'), (9, 'Delhi'), (10, 'Goa'), (11, 'Gujarat'), (12, 'Haryana'), (13, 'Himachal Pradesh'), (14, 'Jammu And Kashmir'), (15, 'Jharkhand'), (16, 'Karnataka'), (17, 'Kerala'), (18, 'Madhya Pradesh'), (19, 'Maharashtra'), (20, 'Manipur'), (21, 'Meghalaya'), (22, 'Mizoram'), (23, 'Nagaland'), (24, 'Orissa'), (25, 'Pondicherry'), (26, 'Punjab'), (27, 'Rajasthan'), (28, 'Sikkim'), (29, 'Tamil Nadu'), (30, 'Tripura'), (31, 'Uttar Pradesh'), (32, 'Uttarakhand'), (33, 'West Bengal')])),
                ('city', models.CharField(max_length=40)),
                ('pin_code', models.CharField(max_length=6, validators=[django.core.validators.RegexValidator(regex='^[0-9]{6}$')])),
                ('effective_since', models.DateField()),
                ('proof', models.FileField(upload_to=veloces.models.helpers.UploadPath('address_proof'))),
                ('veloce_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='veloces.AuthUser')),
            ],
            options={
                'db_table': 'veloce_address',
            },
        ),
    ]
