from django import forms
from veloce import models
from veloce import validators
from veloce import enums
from veloce import models as store_models


class ProductForm(forms.ModelForm):
    image = forms.ImageField(widget=forms.FileInput(attrs={'multiple': True, 'accept': '.jpg, .jpeg, .png, .gif'}),
                             required=True,
                             label="Product Images",
                             validators=[validators.validate_file_extension_image],
                             help_text='notes : extensions : .jpg, .jpeg, .png, .gif | size : 1000 × 800 px | length : 2.5MB')
    demo_video = forms.FileField(
        widget=forms.FileInput(attrs={'multiple': True, 'accept': '.mp4, .mov, .avi, .wmv, .mkv, .3gp'}),
        required=False,
        label="Demo Video Link",
        help_text='notes : extensions : .mp4, .mov, .avi, .wmv, .mkv, .3gp | length :10MB')

    specification = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 3, 'placeholder': 'Write any features/specs...'}),
        label="Short-Description", max_length=4000)
    description = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 3, 'placeholder': 'Write any features/description...'}),
        label="Full-Description", max_length=15000)

    after_warranty_service = forms.MultipleChoiceField(choices=enums.to_choices(enums.WarrantyService),
                                                       widget=forms.SelectMultiple, label="After Warranty Service",
                                                        help_text='notes : ctrl + mouse click to select multiple option.' )
    after_sales_service_provided = forms.MultipleChoiceField(choices=enums.to_choices(enums.SalesService),
                                                             widget=forms.SelectMultiple, label="After Sales Service Provided",
                                                             help_text='notes : ctrl + mouse click to select multiple option.')

    class Meta:
        model = models.Product
        fields = ('category', 'sub_category', 'name', 'vendor', 'specification','description','brand_name','engine_type','place_of_origin','image', 'demo_video',
                  'after_warranty_service', 'local_service_location', 'showroom_location', 'condition',
                   'power_watt', 'dimension', 'certification', 'warranty',
                  'after_sales_service_provided', 'unique_selling_point', 'power',
                  'is_this_physical_product')

    required_css_class = 'required'
            
    def __init__(self, *args, **kwargs):
        super(ProductForm, self).__init__(*args, **kwargs)
        # company_users =  store_models.profile.Profile.objects.using('veloce1_db').filter(account_type = 2,is_complete=True,is_verified=True)
        # auth_user_of_store = store_models.auth_user.AuthUser.objects.using('veloce1_db').all()
        # self.fields['vendor'].queryset = auth_user_of_store 


class ProductEditForm(forms.ModelForm):
    image = forms.ImageField(widget=forms.FileInput(attrs={'multiple': True, 'accept': '.jpg, .jpeg, .png, .gif'}),
                             required=False,
                             label="Product Images",
                             validators=[validators.validate_file_extension_image])
    demo_video = forms.FileField(
        widget=forms.FileInput(attrs={'multiple': True, 'accept': '.mp4, .mov, .avi, .wmv, .mkv, .3gp'}),
        required=False,
        label="Demo Video Link")

    specification = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 3, 'placeholder': 'Write any features/specs...'}),
        label="Short-Description", max_length=4000)
    description = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 3, 'placeholder': 'Write any features/description...'}),
        label="Full-Description", max_length=15000)
    # engine = forms.CharField(required=False)
    after_warranty_service = forms.MultipleChoiceField(choices=enums.to_choices(enums.WarrantyService),
                                                       widget=forms.SelectMultiple, label="After Warranty Service")
    after_sales_service_provided = forms.MultipleChoiceField(choices=enums.to_choices(enums.SalesService),
                                                             widget=forms.SelectMultiple, label="After Sales Service Provided")
    required_css_class = 'required'

    class Meta:
        model = models.Product
        fields = ('category', 'sub_category', 'name', 'brand_name', 'specification','description', 'engine_type','place_of_origin', 'image', 'demo_video',
                  'after_warranty_service', 'local_service_location', 'showroom_location', 'condition',
                  'power_watt', 'dimension', 'certification', 'warranty',
                  'after_sales_service_provided', 'unique_selling_point', 'power',
                  'is_this_physical_product')

class PriceStructureForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(PriceStructureForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'
        self.fields['final_amt'].widget.attrs['readonly'] = True

    required_css_class = 'required'

    class Meta:
        model = models.PriceStructure
        exclude = ['product', 'amt_before_tax']


class ProductDeliveryForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(ProductDeliveryForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'

    class Meta:
        model = models.PackagingDeliveryDetails
        exclude = ['product', 'finance_scheme']

    required_css_class = 'required'


class RatingForm(forms.ModelForm):
    class Meta:
        model = models.ProductRating
        exclude = ['rated_by']

    required_css_class = 'required'


class ProductInquiryForm(forms.ModelForm):
    inquiry_message = forms.CharField(required=True, widget=forms.Textarea(attrs={'rows': 5, 'cols': 40}))

    def __init__(self, *args, **kwargs):
        super(ProductInquiryForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'

    class Meta:
        model = models.ProductInquiry
        exclude = ['product', 'inquiry_by', 'is_product_bill_generated', 'is_product_financed','inquiry_message']

    required_css_class = 'required'


class ProductMediaForm(forms.ModelForm):
    class Meta:
        model = models.ProductMedia
        exclude = ['product']

    required_css_class = 'required'


class BookSalesForm(forms.ModelForm):
    bill_date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    bill_amount = forms.CharField(label="Total Bill Amount", widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    upload_bill = forms.FileField(widget=forms.FileInput(attrs={'accept': '.jpg, .jpeg, .png, .pdf, .docx'}))
    required_css_class = 'required'

    def __init__(self, *args, **kwargs):
        super(BookSalesForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'
        self.fields['dealers_given_finance_scheme'].empty_label = None

    class Meta:
        model = models.BookSale
        exclude = ['is_applied', 'is_loan_approved']

    required_css_class = 'required'
    
    half = ['bill_no','bill_date','billing_party_name','inquired_by','dealer_gst_no','billing_party_gst_no','bill_amount','upload_bill','dealers_given_finance_scheme']


class BookSalesDetailsForm(forms.ModelForm):
    class Meta:
        model = models.BookSaleDetails
        exclude = ['book_sale']

    required_css_class = 'required'


class SalersGivenFinanceSchemeForm(forms.ModelForm):
    product = forms.ModelMultipleChoiceField(queryset=models.Product.objects.all(), label="Product")
    start_date = forms.CharField(widget=forms.widgets.TextInput())
    end_date = forms.CharField(widget=forms.widgets.TextInput())

    class Meta:
        model = models.DealersGivenFinanceScheme
        exclude = ['dealer', 'is_admin_approved', 'is_admin_rejected']

    required_css_class = 'required'

class SalersGivenFinanceSchemeEditForm(forms.ModelForm):
    product = forms.ModelChoiceField(queryset=models.Product.objects.all(), label="Product")
    start_date = forms.CharField(widget=forms.widgets.TextInput())
    end_date = forms.CharField(widget=forms.widgets.TextInput())

    class Meta:
        model = models.DealersGivenFinanceScheme
        exclude = ['dealer', 'is_admin_approved', 'is_admin_rejected']

    required_css_class = 'required'

class EditUploadedBillForm(forms.ModelForm):
    upload_bill = forms.FileField(widget=forms.FileInput(attrs={'multiple': False, 'accept': '.jpg, .jpeg, .png, .pdf'}), required=True,
                             label="Upload Bill")
    required_css_class = 'required'
    class Meta:
        model = models.BookSale
        fields = ['bill_no', 'bill_date', 'bill_amount', 'billing_party_name', 'inquired_by', 'dealer_gst_no',
                  'billing_party_gst_no', 'upload_bill', 'dealers_given_finance_scheme']

    required_css_class = 'required'


class EditUploadedBillWTFForm(forms.ModelForm):
    class Meta:
        model = models.BookSale
        fields = ['bill_no', 'bill_date', 'bill_amount', 'billing_party_name', 'inquired_by', 'dealer_gst_no',
                  'billing_party_gst_no', 'upload_bill']

    required_css_class = 'required'


class EditBookSaleDetailsForm(forms.ModelForm):
    inq_product_name = forms.CharField(required=False, widget=forms.Textarea(attrs={'rows': 1, 'cols': 40}))

    class Meta:
        model = models.BookSaleDetails
        fields = ['ref_inq_no', 'inq_product_name', 'qty', 'inq_product_price', 'inq_product_gross_amt',
                  'inq_product_disc_amt', 'inq_product_tax', 'inq_product_final_amt']

    required_css_class = 'required'
    
    
class CategoryEditForm(forms.ModelForm):
    half=['name','category_img']
    field_order=['name','category_img','description']
    
    class Meta:
        model = models.Category
        fields = ['name','description','category_img']
        widgets = {
        'name': forms.TextInput(attrs={'class':'form-control','placeholder': 'Name'}),
        'description': forms.Textarea(attrs={'class':'form-control','placeholder': 'Write any small description...','rows':3,'cols':3}),
        'category_img': forms.FileInput(attrs={'multiple': False, 'accept': '.jpg, .jpeg, .png, .pdf'}),
        }
    def __init__(self, *args, **kwargs):
        super(CategoryEditForm, self).__init__(*args, **kwargs)
        self.fields['name'].label = "Category Name <small class='asterisk'>*</small>"
        self.fields['description'].label = "Category Description <small class='asterisk'>*</small>"
        self.fields['category_img'].label = "Category Image <small class='asterisk'>*</small>"
        self.fields['category_img'].help_text = '<b>notes</b> : extensions : .jpg, .jpeg, .png | size : 1000 × 800 px | length : 2.5MB'
        
        
 
class SubCategoryEditForm(forms.ModelForm):
    half=['name','category','description','sub_category_img']
    field_order=['category','name','sub_category_img','description']
    
    class Meta:
        model = models.SubCategory
        fields = ['name','description','sub_category_img','category']
        widgets = {
        'name': forms.TextInput(attrs={'class':'form-control','placeholder': 'Name'}),
        'description': forms.Textarea(attrs={'class':'form-control','placeholder': 'Write any small description...','rows':3,'cols':3}),
        'category': forms.Select(attrs={'class': 'form-control'}),
        'sub_category_img': forms.FileInput(attrs={'multiple': False, 'accept': '.jpg, .jpeg, .png, .pdf'}),
        }
    def __init__(self, *args, **kwargs):
        super(SubCategoryEditForm, self).__init__(*args, **kwargs)
        self.fields['name'].label = "SubCategory Name <small class='asterisk'>*</small>"
        self.fields['description'].label = "SubCategory Description"
        self.fields['category'].queryset = store_models.Category.objects.all()
        self.fields['category'].label = "Category <small class='asterisk'>*</small>"  
        self.fields['sub_category_img'].label = "Category Image <small class='asterisk'>*</small>"
        self.fields['sub_category_img'].help_text = '<b>notes</b> : extensions : .jpg, .jpeg, .png | size : 1000 × 800 px | length : 2.5MB'
            
