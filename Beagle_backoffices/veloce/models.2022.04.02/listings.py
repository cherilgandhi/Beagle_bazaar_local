from django.db import models
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
from veloce import validators
from veloce import enums
from django.core.validators import MinValueValidator
from veloce.models.auth_user import AuthUser



class Category(models.Model):
    """
        this model is use to store the data of products category
    """
    name = models.CharField(max_length=50, unique=True, verbose_name="Category Name")
    description = models.TextField(null=True, blank=True, verbose_name="Category Descriptions")
    category_img = models.FileField(upload_to='backoffice/static/veloce-store/category-images/',
                                    verbose_name='Upload Image')
    slug = models.SlugField(max_length=140, unique=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return "%s" % self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Category, self).save(*args, **kwargs)


class SubCategory(models.Model):
    """
        This model is use to store the data of products sub category
    """
    category = models.ForeignKey(Category, related_name="sub_category", on_delete=models.CASCADE)
    name = models.CharField(max_length=50, unique=True, verbose_name="Sub Category Name")
    description = models.TextField(null=True, blank=True, verbose_name="Sub Category Descriptions")
    sub_category_img = models.FileField(upload_to='backoffice/static/veloce-store/sub-category-images/',
                                        verbose_name='Upload Image')
    slug = models.SlugField(max_length=140, unique=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return "%s" % self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(SubCategory, self).save(*args, **kwargs)

class Product(models.Model):
    """
    This model store all the information related to the product
    """
    
    category = models.ForeignKey(Category, related_name="product_categories", verbose_name="Category", on_delete=models.CASCADE)
    sub_category = models.ForeignKey(SubCategory, related_name='product_category', verbose_name="Sub Category", on_delete=models.CASCADE)

    name = models.CharField(max_length=120, verbose_name='Product Name',
                            unique=True)  # 50 piyush.
    vendor = models.ForeignKey(AuthUser, related_name='vendor', on_delete=models.CASCADE, null=True)
    is_featured_product = models.BooleanField(default=False)
    specification = models.TextField(verbose_name="Specification", null=True,
                                     blank=True)
    description = models.TextField(verbose_name="Description", null=True,
                                     blank=True)
    slug = models.SlugField(max_length=140, unique=True, blank=True)
    after_warranty_service = models.CharField(
        verbose_name="After Warranty Service",
        max_length=60
        )
    local_service_location = models.CharField(verbose_name="Local Service Location",
                                              max_length=80, null=False,
                                              blank=False,
                                              help_text='notes : please enter the city eg: Surat')  # Fetch city Drop down menu use Enums
    showroom_location = models.CharField(verbose_name="Showroom Location", 
                                         max_length=100, 
                                         null=True, 
                                         blank=True,
                                         help_text='notes : please enter the city eg: Surat')  # Fetch city Drop down menu use Enums
    condition = models.CharField(
        max_length=10,
        null=False, blank=False,
        verbose_name="Condition",
        choices=enums.to_choices(enums.ProductCondition),
        default=1,
    )
    brand_name = models.CharField(max_length=20,
                                  verbose_name="Brand Name",
                                  help_text='notes : please enter your company brand name ')  # 40 piyush.
    place_of_origin = models.CharField(verbose_name="Place Of Origin",
                                       max_length=80, null=False, blank=False,help_text='notes : please enter the city eg: Surat')
    power_watt = models.CharField(verbose_name="Laser Power(Watt)", max_length=40, null=True, blank=True,help_text="notes : eg: 230 V")  # 15 Piyush.
    power = models.CharField(verbose_name="Input Voltage",max_length=40, null=True, blank=True)  # 40 Piyush.
    dimension = models.CharField(verbose_name="Product Dimension",
                                 null=False, blank=False, max_length=40,
                                 help_text='notes : Dimensions (Width x Length x Height), eg : 400 x 950 x 880')  # 40 Piyush.
    certification = models.CharField(verbose_name="Certification",
                                     null=False, blank=False, max_length=20)  # 30 Piyush.
    warranty = models.PositiveIntegerField(verbose_name='Warranty ( In Months )',
                                           null=False, blank=False,help_text="notes : eg: 24 (if you have 2 year warranty)")  # ,max_length=3  added by Piyush
    after_sales_service_provided = models.CharField(
        verbose_name='After Sales Service Provided',
        null=False, blank=False,
        max_length=60
    )
    engine = models.CharField(max_length=20, null=True, blank=True, )
    engine_type = models.CharField(verbose_name="Technology", max_length=50, null=True, blank=True)
    unique_selling_point = models.CharField(verbose_name="Unique Selling Point", max_length=100, null=True, blank=True)
    is_this_physical_product = models.BooleanField(verbose_name="Is This Physical Product", default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "%s" % self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)


class PriceStructure(models.Model):
    """
    This model store multiple entry of product price
    """
    product = models.ForeignKey(Product, related_name='product_prices', on_delete=models.CASCADE)
    frequency = models.SmallIntegerField(choices=enums.to_choices(enums.Frequency), null=False, blank=False, verbose_name='frequency')
    label = models.CharField(max_length=25, null=False, blank=False, verbose_name='label')  # 50 piyush.
    currency = models.SmallIntegerField(choices=enums.to_choices(enums.Currency), verbose_name='currency')
    amount = models.PositiveIntegerField(null=False, blank=False, verbose_name='Amount')
    disc_per = models.PositiveIntegerField(verbose_name='Disc in per ')
    disc_amt = models.PositiveIntegerField(verbose_name='Disc in amt')
    amt_before_tax = models.PositiveIntegerField(verbose_name='Amt before tax')
    taxes = models.PositiveIntegerField()
    final_amt = models.PositiveIntegerField(null=False, blank=False, verbose_name='Final Amount')
    created_at = models.DateTimeField(auto_now_add=True)
    is_visible_home = models.BooleanField(default=False)

    def __str__(self):
        return "%s" % self.pk


def get_image_filename(instance, filename):
    """
        This function get name of the file
    :param filename:
    :return:
    """
    return "backoffice/static/veloce-store/product-images/%s" % (filename)


def get_video_filename(instance, filename):
    """
    This function wll return the name of the video file
    :param filename:
    :return:
    """
    return "backoffice/static/veloce-store/product-videos/%s" % (filename)


class ProductMedia(models.Model):
    """
    This model will store multiple images of the products.
    """
    product = models.ForeignKey(Product, related_name='product_media', on_delete=models.CASCADE)

    image = models.FileField(upload_to=get_image_filename, verbose_name='Product Images', null=True, blank=True,
                             validators=[validators.validate_file_extension_image])

    demo_video = models.FileField(upload_to=get_video_filename, verbose_name='Demo Videos',
                                  null=True, blank=True, validators=[validators.validate_file_extension_video])

    is_feature_image = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.pk


class ProductRating(models.Model):
    """
    This model will store multiple images of the products.
    """
    product = models.ForeignKey(Product, related_name='product_rating', on_delete=models.CASCADE)
    rated_by = models.ForeignKey(AuthUser, related_name='rating_users', on_delete=models.CASCADE)
    rated_value = models.IntegerField(null=True, blank=True)
    message = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.pk

    class Meta:
        unique_together = (('product', 'rated_by'),)


class ProductInquiry(models.Model):
    """
    This model will store multiple images of the products.
    """
    product = models.ForeignKey(Product, related_name='product_inquiry', on_delete=models.CASCADE)
    inquiry_by = models.ForeignKey(AuthUser, related_name='inquiry_by_user', on_delete=models.CASCADE)
    inquiry_message = models.TextField()
    forwarded_to = models.PositiveIntegerField(default=0)
    is_product_bill_generated = models.BooleanField(default=False)
    is_product_financed = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.inquiry_message


class PackagingDeliveryDetails(models.Model):
    """
    This model will store information about product Packaging & Delivery Details
    """
    product = models.OneToOneField(Product, related_name='product_delivery_detail', on_delete=models.CASCADE)
    selling_units = models.SmallIntegerField(verbose_name="Selling Units")
    single_package_size = models.CharField(max_length=30, verbose_name="Single Package Size")
    single_gross_weight = models.CharField(max_length=30, verbose_name="Single Gross Weight")
    package_type = models.SmallIntegerField(
        choices=enums.to_choices(enums.PackageType),
        default=1,
        verbose_name="Package Type"
    )
    packing_size = models.CharField(max_length=30, verbose_name="Packing Size")
    packing_weight = models.CharField(max_length=30, verbose_name="Packing Weight")
    picture = models.ImageField(upload_to=get_image_filename, null=True)
    lead_time = models.CharField(max_length=25, verbose_name="Lead Time")
    shipping_charges = models.CharField(max_length=80, verbose_name="Shipping Charges")
    shipping_time = models.CharField(max_length=25, verbose_name="Shipping Time")
    finance_scheme = models.BooleanField(default=False, verbose_name="Finance Scheme")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.id


class Sale(models.Model):
    """
    This model will store multiple images of the products.
    """
    name = models.CharField(max_length=100)
    discount_type = models.SmallIntegerField(
        choices=enums.to_choices(enums.DiscountType),
        default=1
    )
    value = models.PositiveIntegerField(default=0)
    category = models.ForeignKey(Category, related_name='discount_on_category', on_delete=models.CASCADE, null=True,
                                 blank=True, default=None)
    sub_category = models.ForeignKey(SubCategory, related_name='discount_on_sub_category', on_delete=models.CASCADE,
                                     null=True, default=None, blank=True)
    # industry = models.ForeignKey(Industry, null=True, default=None, related_name='discount_on_industry', on_delete=models.CASCADE, blank=True)
    product = models.ForeignKey(Product, related_name='discount_on_product', on_delete=models.CASCADE, null=True,
                                blank=True, default=None)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.name


class Voucher(models.Model):
    """
    This model will store voucher related information for the products
    """
    discount_code = models.CharField(max_length=32, unique=True)
    discount_type = models.SmallIntegerField(choices=enums.to_choices(enums.DiscountType), default=1)
    value = models.PositiveIntegerField(default=0)
    minimum_requirement = models.SmallIntegerField(choices=enums.to_choices(enums.MinimumRequirements), default=0)
    minimum_value = models.PositiveIntegerField(default=0)
    Limit_to_one_use_per_customer = models.BooleanField(default=False)
    product = models.ForeignKey(Product, related_name='product_coupon_code', on_delete=models.CASCADE, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.discount_code


class DealersGivenFinanceScheme(models.Model):
    """
    This model will store info general reward points
    """
    dealer = models.ForeignKey(AuthUser, related_name='dealers_finance_scheme', on_delete=models.CASCADE)
    rate_of_interest = models.DecimalField(decimal_places=2, max_digits=6, verbose_name="ROI(%)", validators=[MinValueValidator(1)])
    tenure = models.PositiveIntegerField(verbose_name="Tenure (in months)")
    product = models.CharField(max_length=200)
    is_admin_approved = models.BooleanField(default=False)
    is_admin_rejected = models.BooleanField(default=False)
    start_date = models.DateTimeField(null=True, blank=True)
    end_date = models.DateTimeField(null=True, blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s, %s" % (str(self.rate_of_interest) + "%", str(self.tenure) + " months")


class BookSale(models.Model):
    """
    This model will store info about bill discounting
    """
    inquiry = models.OneToOneField(ProductInquiry, related_name='bill_disc_inquiry', on_delete=models.CASCADE)
    bill_no = models.CharField(max_length=32, unique=True)
    bill_date = models.DateField()
    bill_amount = models.DecimalField(max_digits=12, decimal_places=2, verbose_name="Total Bill Amount")
    # bill_due_date = models.DateField()billDiscountingModal
    billing_party_name = models.CharField(max_length=40)
    inquired_by = models.CharField(max_length=40)
    dealer_gst_no = models.CharField(max_length=15, null=True, blank=True)
    billing_party_gst_no = models.CharField(max_length=15, null=True, blank=True)
    upload_bill = models.FileField(upload_to='backoffice/static/veloce-store/uploaded-bills/', verbose_name='Upload Bill')
    # upload_bill = models.FileField(upload_to='veloce-store/', verbose_name='Upload Bill')
    is_applied = models.BooleanField(default=False)
    is_loan_approved = models.BooleanField(default=False)
    dealers_given_finance_scheme = models.ForeignKey(DealersGivenFinanceScheme, models.CASCADE, null=True,
                                                        blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.bill_no


class BookSaleDetails(models.Model):
    """
    This model will store info about bill discounting details
    """
    book_sale = models.ForeignKey(BookSale, related_name='book_sale_details', on_delete=models.CASCADE)
    ref_inq_no = models.ForeignKey(ProductInquiry, related_name='book_sale_inquiry', on_delete=models.CASCADE)
    inq_product_name = models.TextField(max_length=45)
    qty = models.PositiveIntegerField()
    inq_product_price = models.PositiveIntegerField()
    inq_product_gross_amt = models.PositiveIntegerField()
    inq_product_disc_amt = models.PositiveIntegerField()
    inq_product_tax = models.PositiveIntegerField()
    inq_product_final_amt = models.PositiveIntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.inq_product_name


class GeneralRewardPoints(models.Model):
    """
    This model will store info general reward points
    """
    dealer_reward_point = models.PositiveIntegerField(null=True, blank=True)
    customer_reward_point = models.PositiveIntegerField(null=True, blank=True)
    gen_reward_start_date = models.DateTimeField()
    gen_reward_end_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.id


class SpecialRewardPoints(models.Model):
    """
    This model will store info general reward points
    """
    reward_to_dealer = models.OneToOneField(AuthUser, related_name='spl_dealer_reward', on_delete=models.CASCADE, null=True,
                                            blank=True)
    reward_product = models.ManyToManyField(Product, related_name='reward_product')
    dealer_reward_point = models.PositiveIntegerField(null=True, blank=True)
    customer_reward_point = models.PositiveIntegerField(null=True, blank=True)
    gen_reward_start_date = models.DateTimeField()
    gen_reward_end_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.reward_to_dealer


class TransactionRewardDetails(models.Model):
    """
    This model will store info general reward points
    """
    book_sale = models.ForeignKey(BookSale, related_name='trans_book_sale', on_delete=models.CASCADE)
    dealer_rewards = models.ForeignKey(AuthUser, related_name='trans_dealer_reward', on_delete=models.CASCADE)
    dealer_reward_point = models.PositiveIntegerField()
    customer_rewards = models.ForeignKey(AuthUser, related_name='trans_customer_reward', on_delete=models.CASCADE)
    customer_reward_point = models.PositiveIntegerField()
    transaction_date = models.DateTimeField(auto_now_add=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s" % self.id


#created by ravi
class DealerSelection(models.Model):
    dealer = models.ForeignKey(AuthUser, related_name='Profile', on_delete=models.CASCADE,null=True, blank=True)
    institution = models.ForeignKey(AuthUser, related_name='ProductRating', on_delete=models.CASCADE ,null=True, blank=True)
    pin_code = models.CharField(max_length=6,null=True, blank=True)
    city = models.CharField(max_length=40,null=True, blank=True)
    state = models.CharField(max_length=55,null=True, blank=True)
    is_pending = models.BooleanField(default=True,null=True, blank=True)
    is_application_rejected = models.BooleanField(default=False,null=True, blank=True)
    by_whom = models.CharField(max_length=70,null=True, blank=True)
    reject_reason = models.CharField(max_length=256,null=True, blank=True)
    has_qa_applied = models.BooleanField(default=False)


class SelectProductByDealer(models.Model):
    product = models.ForeignKey(Product, related_name='product',on_delete=models.CASCADE)
    dealerselection = models.ForeignKey(DealerSelection,on_delete=models.CASCADE)
    is_product_rejected = models.BooleanField(default=False,null=True, blank=True)
    by_whom = models.CharField(max_length=70,null=True, blank=True)
    reject_reason = models.CharField(max_length=256,null=True, blank=True)

class QuestionAnswer(models.Model):
    dealerselection = models.ForeignKey(DealerSelection,on_delete=models.CASCADE)
    question = models.CharField(max_length=512)
    by_whom =   models.ForeignKey(AuthUser,related_name = 'bywhom',on_delete=models.CASCADE)
    quecreated_at = models.DateTimeField(auto_now_add=True)
    answer = models.CharField(max_length=512,null=True,blank=True)
    to_whom =   models.ForeignKey(AuthUser,related_name = 'towhom',on_delete=models.CASCADE)
    anscreated_at = models.DateTimeField(null=True)
    
class UserOrder(models.Model):
    user = models.ForeignKey(AuthUser,on_delete=models.DO_NOTHING)
    order_id = models.CharField(max_length=25,null=False) # added manually when any order comes
    payment_status = models.SmallIntegerField(choices=enums.to_choices(enums.PaymentStatus)) #COMPLETE, FAILED
    order_status = models.SmallIntegerField(choices=enums.to_choices(enums.OrderStatus),default=0) #PENDING, PACKED,READY_FOR_SHIPMENT
    payment_method = models.CharField(max_length=20) # RAZORPAY - payment gateway name in capital
    transaction_id = models.CharField(max_length=20) # tranzection id by gateway paid
    total_transaction_amount = models.PositiveIntegerField() # total tranzection amount while payment
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)
    
class UserOrderProductList(models.Model):
    user = models.ForeignKey(AuthUser,on_delete=models.DO_NOTHING,null=True)
    user_order = models.ForeignKey(UserOrder,on_delete=models.CASCADE)
    product_name = models.SlugField(max_length=140)
    product_images = models.ImageField(upload_to = get_image_filename,null = True)
    quantity = models.PositiveIntegerField(default=0)
    product_disc = models.SmallIntegerField(choices=enums.to_choices(enums.TrueOrFalse), default=0)
    product_amount = models.PositiveIntegerField()
    discount_amount = models.PositiveIntegerField()
    product_taxes = models.PositiveIntegerField()
    product_final_amount = models.PositiveIntegerField()
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, null=True)
    
    
class UserOrderAddress(models.Model):
    user_order = models.ForeignKey(UserOrder,on_delete=models.CASCADE)
    firstname = models.CharField(max_length=25,verbose_name='First Name <small class="asterisk">*</small>')
    lastname = models.CharField(max_length=25, verbose_name='Last Name <small class="asterisk">*</small>')
    company_name = models.CharField(max_length=100,verbose_name='Company Name <small class="asterisk">*</small>')
    street_address = models.CharField(max_length=200,verbose_name='Street Address <small class="asterisk">*</small>')
    city = models.CharField(max_length=40,verbose_name='City <small class="asterisk">*</small>')
    state = models.CharField(max_length=40,verbose_name='State <small class="asterisk">*</small>')
    pin_code = models.CharField(max_length=6,verbose_name='Pin Code <small class="asterisk">*</small>')
    phone_number = models.CharField(max_length=10,null=True,blank=True,verbose_name='Phone Number <small class="asterisk">*</small>')
    email = models.CharField(max_length=35,verbose_name='Email <small class="asterisk">*</small>')
    country = models.CharField(choices=enums.countries,max_length = 2,default= 'IN',verbose_name='Country <small class="asterisk">*</small>')
    address_type = models.SmallIntegerField(choices=enums.to_choices(enums.CheckoutAddressType),verbose_name='Address Type <small class="asterisk">*</small>')
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)
    
