from django.http.response import HttpResponse
from django.http import JsonResponse
from django.shortcuts import redirect,render
from django.template.response import TemplateResponse
from django.shortcuts import render,get_object_or_404
from django.conf import settings
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
import json, time
from django.contrib.auth.hashers import make_password
import datetime
from django.db.models import F
from django.db.models import Q
from datetime import datetime,timezone
from django.contrib.auth import get_user_model
from django.utils.safestring import mark_safe
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from bizcred.modules import company_details
User = get_user_model()

#-----------------------------------------------------------------------|
# backoffice data access                                               #|
                                                                       #|
from backoffice import models as backoffice_modules                    #|
from backoffice import forms as backoffice_forms                       #|
from backoffice import enums                                           #|
from backoffice import methods as backoffice_methods                   #|
from django.contrib.sessions.models import Session                     #|
# from backoffice.methods import register_methods                      #|
#-----------------------------------------------------------------------|
# bizcred data access                                                  #|
                                                                       #|
from bizcred import models as bizcred_models                           #| 
from bizcred.models import auth_user as bizcred_user                   #| 
from bizcred import enums as bizcred_enums                             #|
from bizcred import form_map                                           #|
from bizcred import models as mods                                     #|
from bizcred import methods as bizcred_methods                         #|
from bizcred import crif_commercial as bizcred_crif_commercial         #|
from bizcred import forms as bizcred_forms                             #|
                                                                       #|
#-----------------------------------------------------------------------+
# store data access                                                    #|
                                                                       #|
from veloce.models import auth_user as store_user # AuthUser           #|
from veloce.models import profile as store_profile   # Profile         #|
from veloce import models as store_models                              #|
from veloce import forms as store_forms                                #|  
# auth      -----   VeloceUser, RecentlyVisited                        # <------------------------------------------------|
# listings  -----   Category, SubCategory, Product, PriceStructure, ProductMedia, ProductRating, ProductInquiry,         #|
                        # PackagingDeliveryDetails, Sale, Voucher, DealersGivenFinanceScheme, BookSale, BookSaleDetails, #|
                        # GeneralRewardPoints, SpecialRewardPoints, TransactionRewardDetails, DealerSelection,           #|
                        # SelectProductByDealer, QuestionAnswer                                                          #|
#------------------------------------------------------------------------------------------------------------------------------------------|                       
# fintech data access                                                                                                                     #|
from veloces.models import auth_user as fintech_user # AuthUser                                                                           #|
from veloces.models import profile as fintech_profile  # Profile, GeneralInfo, EmploymentInfo, InstitutionInfo,KycDocuments, Address      #|
from veloces import models as fintech_models                                                                                              #|
# loan      -----   Loan, Lender                                                                                                          #|
# application ---- VeloceApplication, ReviewedVeloceApplication, ApplicationStep1, InvoiceStep1, ApplicationStep2,                         +----+
                                       # GeneralVeloceMarkup, DealerSpecialVeloceMarkup, ApplicationSpecialVeloceMarkup, FinanceSchemeConfig,  #|
                                       # ApplicationPaymentStatus                                                                              #|
#-----------------------------------------------------------------------------------------------------------------------------------------------|


# Create your views here.


def query(request):
    '''
    This is for the any queryset tril.
    '''
    return HttpResponse('this is ')

def bizcred_super_user_data():
    '''
    This give the bizcred super_user data.
    '''
    super_user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').filter(is_superuser =True)
    super_dict ={}
    super_dict['Super User'] = super_user.count()
    return super_dict

def all_account_counts():
    '''
        This give the all the portal users count role wise count.
    '''
    length_of_account = len(bizcred_enums.AccountType)
    count_list =[]    
    for account in range(1,length_of_account):
        metadata_module = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = account)
        dict_name = bizcred_enums.AccountType(account).name
        dict_name = dict_name.replace('_', ' ')
        count = metadata_module.count()
        dict = {}
        dict['Total '+dict_name] = count
        count_list.append(dict)
    return count_list

def active_account_counts():
    '''
        This gives the all the portal user count role wise active users counts.
    '''
    length_of_account = len(bizcred_enums.AccountType)
    count_list =[]  
    
    for account in range(1,length_of_account):
        metadata_module = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = account,user__is_active = True)
        dict_name = bizcred_enums.AccountType(account).name
        dict_name =dict_name.lower()
        count = metadata_module.count()
        dict = {}
        dict['Active '+dict_name] = count
        count_list.append(dict)
        
    return count_list

def not_active_account_counts():
    '''
        This gives the all the portal user count role wise deactive users counts.
    '''
    length_of_account = len(bizcred_enums.AccountType)
    count_list =[]
 
    for account in range(1,length_of_account):
        metadata_module = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = account,user__is_active = False)
        dict_name = bizcred_enums.AccountType(account).name
        dict_name =dict_name.lower()
        count = metadata_module.count()
        dict = {}
        dict['Not Active '+dict_name] = count
        count_list.append(dict)
     
    return count_list

@login_required
def index(request):
    '''
    This function is of user dashboard. with user_type = 2.
    '''
    role_users = bizcred_models.metadata.Metadata.objects.using('bizcred_db').all().count()
    product_lists_counts = store_models.Product.objects.using('veloce1_db').all().count()
    product_inquiry_list_counts = store_models.ProductInquiry.objects.using('veloce1_db').all().count()
    all_account_counts_dicts = all_account_counts()
    
    # in feature use if need
    active_user_counts_dicts = active_account_counts()
    not_active_account_counts_dicts = not_active_account_counts()
    total_users = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').all().count()
    total_super_users = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').filter(is_superuser =True).count()

    context ={
        'role_users' : role_users,
        'product_lists_counts':product_lists_counts,
        'product_inquiry_list_counts':product_inquiry_list_counts,
        'all_account_counts_dicts':all_account_counts_dicts,
        
        # 'active_user_counts_dicts': active_user_counts_dicts,
        # 'total_users' : total_users,
        # 'total_super_users': total_super_users,
        # 'not_active_account_counts_dicts': not_active_account_counts_dicts,
    }
    return TemplateResponse(request,'backoffice/user-templates/user-index.html',context)


@login_required
def admin_index(request):
    '''
    This function is of admin dashboard. with user_type = 1.
    '''
    user = backoffice_modules.credentials.UserCredentials.objects.using('auth_db').get(user = request.user)
    if not user.user_type == 1:
        return redirect('backoffice:index')
    
    total_backoffice_users = User.objects.all().count()
    total_backoffice_active_users = User.objects.filter(is_active = True).count()
    total_backoffice_non_active_users = User.objects.filter(is_active = False).count()
    context ={
        'total_backoffice_users' : total_backoffice_users,
        'total_backoffice_active_users': total_backoffice_active_users,
        'total_backoffice_non_active_users':total_backoffice_non_active_users,
    }
    return TemplateResponse(request, 'backoffice/admin-templates/admin-index.html',context)


@login_required
def signup(request):
    error = ''
    form = backoffice_forms.auth.RegisterForm()
    if request.method == 'POST':
        form = backoffice_forms.auth.RegisterForm(request.POST)
        email = request.POST['email']
        if form.is_valid():
            try:
                is_user_exit = User.objects.get(email=email)
            except:
                is_user_exit = ''
            
            if not is_user_exit:
                try:
                    password = form.cleaned_data.get('password')
                    email = form.cleaned_data.get('email').lower()
                    first_name = form.cleaned_data.get('first_name')
                    last_name = form.cleaned_data.get('last_name')
                    pin_code = form.cleaned_data.get('pin_code')
                    unit_number = form.cleaned_data.get('unit_number')
                    street_address = form.cleaned_data.get('street_address')
                    city = form.cleaned_data.get('city')
                    state = form.cleaned_data.get('state')
                    tel_number = form.cleaned_data.get('tel_number')
                    user_type = form.cleaned_data.get('user_type')
                    user_position = form.cleaned_data.get('user_position')
                    user = User.objects.create_user(
                        username=email,
                        first_name=first_name,
                        last_name=last_name,
                        email=email,
                        password=password,
                    )
                    profile = backoffice_modules.profiles.Profile.objects.using('auth_db').create(user = User.objects.get(email=email),
                        unit_number = unit_number,
                        street_address = street_address,
                        tel_number = tel_number,
                        pin_code = pin_code,
                        city = city,
                        state = state,
                        user_position = user_position,
                    ).save()
                    backoffice_modules.credentials.UserCredentials.objects.using('auth_db').create(user = User.objects.get(email=email),
                        user_type = user_type
                    ).save()
                    messages.success(request,'registrations successfull you are welcome to this portal')
                    return redirect('backoffice:backoffice_users')
                except:
                    error = "User with this email already exists."
            else:
                error = "User with this email already exists."     
    if request.is_ajax():
        email = request.GET.get('email')
        if User.objects.filter(email=email).exists():
            return JsonResponse({'data':'true'})
        else:
            return JsonResponse({'data':'false'})   
    context ={
        'form' : form,
        'error': error,
        }   
    return render(request,'backoffice/signup.html',context)

def signin(request):
    error = ''
    success=''
    
    if request.user:
        if request.user.is_authenticated:
            return redirect('backoffice:index')
    
    if request.GET.get('success', '') == '1':
        success = "Registration successful! Welcome to backoffice portal."
    
    form = backoffice_forms.auth.LoginForm()
    if request.method == 'POST':
        form = backoffice_forms.auth.LoginForm(request.POST)
        
        username = request.POST['username'].lower()
        password = request.POST['password']
        user = authenticate(request, username = username, password = password)
        
        if len(username) >= 8 and len(password) >= 8:
            if user is not None:
                form = login(request, user)
                success = f' welcome {username} !!'
                next_url = request.GET.get("next")
                if next_url:
                    return redirect(next_url)
                return redirect('backoffice:index')
            else:
                messages.error(request, 'Incorrect login details.')  
    context ={
        'form' : form,
        'error': error,
        'success':success,
    }
    return TemplateResponse(request,'backoffice/signin.html',context)

@login_required
def logout_view(request):
    logout(request)
    return redirect('backoffice:signin')
    
@login_required
def all_users(request):
    bizcred_users = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').all()
    page_num = request.GET.get('page', 1)
    paginator = Paginator(bizcred_users, 10)
    try:
        page_obj = paginator.page(page_num)
    except PageNotAnInteger:
        page_obj = paginator.page(1)
    except EmptyPage:
        page_obj = paginator.page(paginator.num_pages)
    context ={  
        'bizcred_users':page_obj,
    }
    return TemplateResponse(request,'backoffice/user-templates/all-users.html',context)

def filter_user_on_portal_by_account_type(account_type):
    '''
    This function is used to get the all portal users 
    basic details using account type.
    '''
    metadata_users = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = account_type)
    user_email = []
    for user in metadata_users:
        user_email.append(user.user.email)
    
    main_list = []
    for email in user_email:
        user_dict = {}
        request_user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(email = email)
        auth_user ={
            'user_id' : request_user.id,
            'first_name' : request_user.first_name,
            'last_name' : request_user.last_name,
            'username' : request_user.username,
            'email' : request_user.email,
        }
        user_dict['auth_user'] = auth_user

        try:
            phone_module = bizcred_models.phone.Phone.objects.using('bizcred_db').get(user = request_user)
            phone_number = {
                'phone_number': phone_module.phone_number,
            }
        except:
            phone_number = {
                'phone_number': '',
            }
        user_dict['phone_number'] = phone_number
        
        try:
            address_module = bizcred_models.address.Address.objects.using('bizcred_db').get(user = request_user)
            address = {
                'unit_number':address_module.unit_number,
                'street_address':address_module.street_address,
                'pin_code': address_module.pin_code,
                'city': address_module.city,
                'state': enums.IndiaStates(address_module.state).name,
            }
        except:
            address = {
                'pin_code':'',
                'city': '',
                'state': '',
            }
        user_dict['address'] = address
        main_list.append(user_dict)  
    return main_list

def get_count_of_pending_by_account_type(account_type):
    '''
    This function give the count of the account for approval pending.
    '''
    passed_account_type = account_type
    users = []
    for account_type in form_map.FORM_MAP:
        if passed_account_type == account_type: 
            mask = form_map.MASKS[account_type]
            users += mods.metadata.Metadata.objects.using('bizcred_db').filter(
                account_type=account_type
            ).annotate(
                completed=F('completion').bitand(mask),
                reviewed=F('completion').bitand(F('profile_reviewed'))
            ).filter(
                completed=mask
            ).exclude(
                reviewed=F('completion')
            ).all()
            counts = len(users)
        else:
            pass
    return counts

def get_total_count_of_account_type_dict(counting_lists):
    '''
    This give the total count of the portal user role wise.
    '''
    total_count=0
    for counting_list in counting_lists:
        total_count +=1
    return total_count


@login_required
def user_customer(request):
    account_type = 1
    customers = filter_user_on_portal_by_account_type(account_type)
    total_count = get_total_count_of_account_type_dict(customers)
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(customers, 10)
    
    try:
        customers = paginator.page(page)
    except PageNotAnInteger:
        customers = paginator.page(1)
    except EmptyPage:
        customers = paginator.page(paginator.num_pages)
    
    context = {
        'customers':customers,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-customer.html',context)


def get_company_product_calculation(user_list_without_products):
    for user_list_without_product in user_list_without_products:
        user_single_dict = user_list_without_product
        user_product_lists_count = store_models.Product.objects.using('veloce1_db').filter(vendor__email = user_single_dict['auth_user']['email']).count()
        product_counts = {
            'product_counts' : user_product_lists_count
        }
        user_single_dict['product_details'] = product_counts
    return user_list_without_products

def get_company_name(user_list_without_company_names):
    for user_list_without_company_name in user_list_without_company_names :
        user_single_dict = user_list_without_company_name
        company_details = bizcred_models.metadata.Metadata.objects.using('bizcred_db').get(user__email = user_single_dict['auth_user']['email'])
        company_name = {
            'company_name' : company_details.org_name
        }
        user_single_dict['company_details'] = company_name
    return user_list_without_company_names

@login_required
def user_company(request):
    account_type = 2
    #this below filter has basic details of company with the account type = 2 passing in function.
    # (auth_user, phone_number, address, product_details, company_details)
    companys = filter_user_on_portal_by_account_type(account_type)
    
    # this function need the list of all user where it can add the company product calculation (product_details)
    companys = get_company_product_calculation(companys)
    
    # this function need the list of user where it can add the company name (company_details).
    companys = get_company_name(companys)
    
    # this function give the count on bases of account_type = 2
    total_count = get_total_count_of_account_type_dict(companys)
    
    # this function give the pending profile approve count on bases of account_type = 2
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(companys, 10)
    
    try:
        companys = paginator.page(page)
    except PageNotAnInteger:
        companys = paginator.page(1)
    except EmptyPage:
        companys = paginator.page(paginator.num_pages)
        
    context = {
        'companys':companys,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-company.html',context)

@login_required
def user_distributor(request):
    account_type = 5
    distributors = filter_user_on_portal_by_account_type(account_type)
    total_count = get_total_count_of_account_type_dict(distributors)
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(distributors, 10)
    
    try:
        distributors = paginator.page(page)
    except PageNotAnInteger:
        distributors = paginator.page(1)
    except EmptyPage:
        distributors = paginator.page(paginator.num_pages)
    
    context = {
        'distributors':distributors,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-distributor.html',context)

@login_required
def user_dealer(request):
    account_type = 4
    dealers = filter_user_on_portal_by_account_type(account_type)
    total_count = get_total_count_of_account_type_dict(dealers)
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(dealers, 10)
    
    try:
        dealers = paginator.page(page)
    except PageNotAnInteger:
        dealers = paginator.page(1)
    except EmptyPage:
        dealers = paginator.page(paginator.num_pages)
        
    context = {
        'dealers':dealers,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-dealer.html',context)

@login_required
def user_service_agent(request):
    account_type = 6
    service_agents = filter_user_on_portal_by_account_type(account_type)
    total_count = get_total_count_of_account_type_dict(service_agents)
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(service_agents, 10)
    
    try:
        service_agents = paginator.page(page)
    except PageNotAnInteger:
        service_agents = paginator.page(1)
    except EmptyPage:
        service_agents = paginator.page(paginator.num_pages)
    
    context = {
        'service_agents':service_agents,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-service-agent.html',context)

@login_required
def user_lender(request):
    account_type = 3
    user_lenders = filter_user_on_portal_by_account_type(account_type)
    total_count = get_total_count_of_account_type_dict(user_lenders)
    pending_count =  get_count_of_pending_by_account_type(account_type)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(user_lenders, 10)
    
    try:
        user_lenders = paginator.page(page)
    except PageNotAnInteger:
        user_lenders = paginator.page(1)
    except EmptyPage:
        user_lenders = paginator.page(paginator.num_pages)
        
    context = {
        'user_lenders':user_lenders,
        'pending_count':pending_count,
        'total_count':total_count
    }
    return TemplateResponse(request,'backoffice/user-templates/user-lender.html',context)


def user_pending_profile(request,account_string):
    '''
    This function shows the list of role user approval pending.
    '''
    user_t = int(request.GET.get('account'))
    user_backend_string = bizcred_enums.AccountType(user_t).name
    
    if account_string == user_backend_string.lower():
        user_type = user_t
    else:
        user_type = ''
        
  
    users = []
    for account_type in form_map.FORM_MAP:
        mask = form_map.MASKS[account_type]
        users += mods.metadata.Metadata.objects.using('bizcred_db').filter(
            account_type=account_type
        ).annotate(
            completed=F('completion').bitand(mask),
            reviewed=F('completion').bitand(F('profile_reviewed'))
        ).filter(
            completed=mask
        ).exclude(
            reviewed=F('completion')
        ).all()
        
    return render(request, 'backoffice/user-templates/common-list-profiles.html', {
        'metas': users,
        'account_types': dict(bizcred_enums.to_choices(bizcred_enums.AccountType)),
        'filter_account':user_type,
    })


@login_required
def admin_profiles(request):
    '''
    this function shows the approval list of all the users of portal.
    '''
    # user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').all()
    # print(user)

    users = []
    print(users)
    for account_type in form_map.FORM_MAP:
        mask = form_map.MASKS[account_type]
        users += mods.metadata.Metadata.objects.using('bizcred_db').filter(
            account_type=account_type
        ).annotate(
            completed=F('completion').bitand(mask),
            reviewed=F('completion').bitand(F('profile_reviewed'))
        ).filter(
            completed=mask
        ).exclude(
            reviewed=F('completion')
        ).all()
        
    return render(request, 'backoffice/admin/list-profiles.html', {
        'metas': users,
        'account_types': dict(bizcred_enums.to_choices(bizcred_enums.AccountType)),
    })


@login_required
def admin_view(request, uid):
    '''
    from this function single user profiles are approved or rejected
    '''
    user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(id=uid)
    meta = user.metadata
    mask = form_map.MASKS[meta.account_type]
    modules = form_map.FORM_MAP[meta.account_type]
    if request.method == 'POST':
        step = request.POST.get("step")
        status = bizcred_methods.level_status(request, modules, meta)
        for i in status:
            if i['level'] == modules[int(step) - 2].level and (i['verified_count'] == 1 or i['verified_count'] == 0):
                try:
                    email_data = mods.level_email.LevelEmail.objects.using('bizcred_db').get(user=user, level=modules[int(step) - 2].level,
                                                                         is_approved=False)
                except:
                    email_data = ''
                if email_data:
                    bizcred_methods.level_approved_email(user, modules[int(step) - 2].level, meta.account_type, email_data,
                                                 request)
        if step and step.isnumeric():
            meta.approve(int(step) - 1)
            if int(step) == 8:
                meta.approve(int(step) - 1)
    
    main_form_list = []
    modules_instances = form_map.FORM_MAP[meta.account_type]
    status_index = 0
    for modules_instance in modules_instances:
        for form in modules_instance.forms:
            print('forms =>',form)
        status_index +=1
        status = meta.get_status(status_index-1)
        if not status == 'Incomplete':
            for form in modules_instance.forms:
                single_model_list = []
                user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(id=uid)
                status = meta.get_status(status_index-1)
                model_status = {'model_status' : status}
                module_title = {'module_title': modules_instance.title}
                index= 1
                if not form.skip_render:
                    form = form(instance=modules_instance.instance(user,index-1)[0])
                    model_form = {'form':form }
                    single_model_list.append(model_status)
                    single_model_list.append(module_title)
                    single_model_list.append(model_form)
                    main_form_list.append(single_model_list)
        
    return render(request, 'backoffice/admin/view-profile.html',{
        'modules': modules,
        'meta': meta,
        'complete': meta.equals_mask(mask),
        'target_user': user,
        'main_list' :main_form_list,
    })

@login_required
def admin_reject(request, uid, step):
    '''
    If the single user profile is rejected then this function
    asked the rejected reason and email notify.
    '''
    print(step)
    print(uid)
    user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(id=uid)
    meta = user.metadata
    modules = form_map.FORM_MAP[meta.account_type]
    module = modules[int(step)]
    if request.method == 'POST':
        form = bizcred_forms.admin.ApplicationRejectForm(request.POST, instance=meta)
        if form.is_valid():
            meta.reject(step, form.data.get("reject_reason"))
            module.model.objects.using('bizcred_db').filter(user=user).update(reject_reason=request.POST["reject_reason"])
            bizcred_methods.rejected_info_email(user, meta, module.title, module)
            url = "/admin/dashboard/profiles/"+str(uid)
            return redirect(url)
    else:
        form = bizcred_forms.admin.ApplicationRejectForm()

    return render(request, 'backoffice/admin/reject-profile.html', {
        'meta': meta,
        'form': form
    })

@login_required
def inquiry_list(request):
    '''
    All the portal product inquiry are been listed here.
    '''
    if request.method == "POST":
        inq_id = request.POST['inquiry']
        book_sale_detail_form = store_forms.BookSalesDetailsForm(request.POST)
        print("ajax-----------------------", book_sale_detail_form)
        form = store_forms.BookSalesForm(request.POST, request.FILES)
        if form.is_valid():
            if book_sale_detail_form.is_valid():
                b_sale_form = form.save(commit=False)
                b_sale_form.save()
                store_models.ProductInquiry.objects.using('veloce1_db').filter(id=inq_id).update(is_product_bill_generated=True)
                book_sale_detail_frm = book_sale_detail_form.save(commit=False)
                book_sale_detail_frm.book_sale = b_sale_form
                book_sale_detail_frm.save()
                try:
                    current_sale = store_models.BookSale.objects.using('veloce1_db').get(id=b_sale_form.id)
                    get_buyer = User.objects.using('veloce1_db').get(email=request.POST['inquired_by'])
                    get_bill_amt = int(request.POST['bill_amount'])
                    now = datetime.now(timezone.utc)
                    check_special_reward_exists = store_models.SpecialRewardPoints.objects.using('veloce1_db').filter(
                        gen_reward_end_date__gte=now)
                    if check_special_reward_exists.count() > 0:
                        check_if_dealer_reward_exists = store_models.SpecialRewardPoints.objects.using('veloce1_db').filter(
                            reward_to_dealer=request.user, reward_product=current_sale.inquiry.product)
                        if check_if_dealer_reward_exists.count() > 0:
                            get_spl_dealer_reward = store_models.SpecialRewardPoints.objects.using('veloce1_db').get(
                                reward_to_dealer=request.user)
                            get_spl_dealer_reward_point = (
                                                                    get_bill_amt * get_spl_dealer_reward.dealer_reward_point) / 100
                            get_spl_customer_reward_point = (
                                                                    get_bill_amt * get_spl_dealer_reward.customer_reward_point) / 100
                            store_models.TransactionRewardDetails.objects.using('veloce1_db').create(book_sale=b_sale_form,
                                                                            dealer_rewards_id=request.user.id,
                                                                            dealer_reward_point=get_spl_dealer_reward_point,
                                                                            customer_rewards_id=get_buyer.id,
                                                                            customer_reward_point=get_spl_customer_reward_point)
                        else:
                            check_general_reward_exists = store_models.GeneralRewardPoints.objects.using('veloce1_db').filter(
                                gen_reward_end_date__gte=now)
                            if check_general_reward_exists.count() > 0:
                                get_general_reward = store_models.GeneralRewardPoints.objects.using('veloce1_db').all()
                                get_spl_dealer_reward_point = (get_bill_amt * get_general_reward[
                                    0].dealer_reward_point) / 100
                                get_spl_customer_reward_point = (get_bill_amt * get_general_reward[
                                    0].customer_reward_point) / 100
                                store_models.TransactionRewardDetails.objects.using('veloce1_db').create(book_sale=b_sale_form,
                                                                                dealer_rewards_id=request.user.id,
                                                                                dealer_reward_point=get_spl_dealer_reward_point,
                                                                                customer_rewards_id=get_buyer.id,
                                                                                customer_reward_point=get_spl_customer_reward_point)
                            else:
                                pass
                    else:
                        check_general_reward_exists = store_models.GeneralRewardPoints.objects.using('veloce1_db').filter(
                            gen_reward_end_date__gte=now)
                        if check_general_reward_exists.count() > 0:
                            get_general_reward = store_models.GeneralRewardPoints.objects.using('veloce1_db').all()
                            get_spl_dealer_reward_point = (get_bill_amt * get_general_reward[
                                0].dealer_reward_point) / 100
                            get_spl_customer_reward_point = (get_bill_amt * get_general_reward[
                                0].customer_reward_point) / 100
                            store_models.TransactionRewardDetails.objects.using('veloce1_db').create(book_sale=b_sale_form,
                                                                            dealer_rewards_id=request.user.id,
                                                                            dealer_reward_point=get_spl_dealer_reward_point,
                                                                            customer_rewards_id=get_buyer.id,
                                                                            customer_reward_point=get_spl_customer_reward_point)
                        else:
                            pass
                except Exception as e:
                    print("Error -> " + str(e))
            else:
                print("working-------------------------")

    store_inquirys = store_models.listings.ProductInquiry.objects.using('veloce1_db').all()
    main_list = []
    for store_inquiry in store_inquirys:
        user_dict = {}
        product_inquirier = store_inquiry.inquiry_by.email
        print(product_inquirier)
        metadata_user = bizcred_models.metadata.Metadata.objects.using('bizcred_db').get(user__email = product_inquirier)
        request_user = metadata_user.user.email
        request_user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(email = request_user)

        auth_user ={
            'user_id' : request_user.id,
            'first_name' : request_user.first_name,
            'last_name' : request_user.last_name,
            'username' : request_user.username,
            'email' : request_user.email,
            'metadata_ph_number': metadata_user.phone_num
        }
        user_dict['auth_user'] = auth_user

        product_inquiry = {
            'inquiry_id':store_inquiry.id,
            'inquiry_by_email':store_inquiry.inquiry_by.email,
            'inquiry_product_vendor_email':store_inquiry.product.vendor.email,
            'inquiry_product_is_financed': str(store_inquiry.is_product_financed),
            'inquiry_is_product_bill_generated':str(store_inquiry.is_product_bill_generated),
            'inquiry_created_at' : str(store_inquiry.created_at)[:19],
            'inquiry_message':store_inquiry.inquiry_message,
            'inq_product_id':store_inquiry.product.pk,
            'inq_product_name':store_inquiry.product.name,
            'inq_product_category':store_inquiry.product.category.name,
            'inq_product_subcategory':store_inquiry.product.sub_category.name,
            'inq_product_brand_name':store_inquiry.product.brand_name,
            'inq_product_created_at':str(store_inquiry.product.created_at)[:19],
        }
        user_dict['product_inquiry'] = product_inquiry
        
        try:
            phone_module = bizcred_models.phone.Phone.objects.using('bizcred_db').get(user = request_user)
            phone_number = {
                'phone_number': phone_module.phone_number,
            }
        except:
            phone_number = {
                'phone_number': '',
            }
        user_dict['phone_number'] = phone_number
        
        try:
            address_module = bizcred_models.address.Address.objects.using('bizcred_db').get(user = request_user)
            address = {
                'unit_number':address_module.unit_number,
                'street_address':address_module.street_address,
                'pin_code': address_module.pin_code,
                'city': address_module.city,
                'state': enums.IndiaStates(address_module.state).name,
            }
        except:
            address = {
                'pin_code':'',
                'city': '',
                'state': '',
            }
        user_dict['address'] = address

        main_list.append(user_dict)

    active_office_users = User.objects.filter(is_active = True) 
    user_list =  backoffice_modules.Profile.objects.filter()
    form  = store_forms.BookSalesForm()
    inquirys = main_list
    
    page = request.GET.get('page', 1)
    paginator = Paginator(inquirys, 10)
    
    try:
        inquirys = paginator.page(page)
    except PageNotAnInteger:
        inquirys = paginator.page(1)
    except EmptyPage:
        inquirys = paginator.page(paginator.num_pages)
    
    
    context = {
        'inquirys':inquirys,
        'form': form,
        'active_backoffice_users': active_office_users,
        'user_list':user_list,
    }
    return render(request,'backoffice/user-templates/inquiry-list.html',context)

@login_required
def check_scheme_exists(request):
    try:
        product_id = request.GET['product_id']
        scheme_data = store_models.DealersGivenFinanceScheme.objects.using('veloce1_db').filter(product=product_id, dealer=request.user,
                                                                      is_admin_approved=True, is_active=True)
        start_date = datetime.strftime(scheme_data[0].start_date, '%Y-%m-%d %H:%M:%S')
        end_date = datetime.strftime(scheme_data[0].start_date, '%Y-%m-%d %H:%M:%S')
        print("^^^^^^^^^^^^^^^^^^^^^", scheme_data)
        if scheme_data.exists():
            context = {
                "status": True,
                'scheme_value': "<option value=" + str(scheme_data[0].id) + ">" + str(
                    scheme_data[0].rate_of_interest) + "%, " + str(scheme_data[0].tenure) + " months</option>",
                'started_date': start_date,
                'ended_date': end_date
            }
            print(context, "context")
            return JsonResponse(context)
        else:
            context = {"status": False}
            return JsonResponse(context)
    except Exception as e:
        context = {"status": False}
        print(e)
        return JsonResponse(context)

def ajax_category(request):
    cat_id = request.GET.get('cat_id')
    if cat_id == '00':
        sub_cats = store_models.SubCategory.objects.using('veloce1_db').all()
        # print('cat if ->>>>>>',sub_cats)  
    else:
        sub_cats = store_models.SubCategory.objects.using('veloce1_db').filter(category_id = int(cat_id))
        # print('cat else ->>>>>>',sub_cats)
    html = '<option class="GetSubCategory" value="00">All Sub Category</option>'
    for sub_cat in sub_cats:
        html += '<option value="{0}">{1}</option>'.format(sub_cat.id,sub_cat.name)
    # print(html)
    return JsonResponse({'sub_category':html})

def ajax_subcategory(request):
    sub_cat_id = request.GET.getlist('sub_cat_id[]')
    print(sub_cat_id)
    
    before_filter_companys = []
    product_vendor = []
    # 00 is for all the subcategory 
    if '00' in sub_cat_id:
        sub_cats = store_models.Product.objects.using('veloce1_db').all()
        for sub_cat in sub_cats:
            before_filter_companys.append(sub_cat)
            if not sub_cat.vendor.email in product_vendor:
                product_vendor.append(sub_cat.vendor.email)     
    else:
        for i in sub_cat_id:
            sub_cats = store_models.Product.objects.using('veloce1_db').filter(sub_category_id = int(i))
            for sub_cat in sub_cats:
                before_filter_companys.append(sub_cat)
                if not sub_cat.vendor.email in product_vendor:
                    product_vendor.append(sub_cat.vendor.email)
    
    html = '<option class="GetCompany" value="00">All Company</option>'
    for single_vendor in product_vendor:
        company = bizcred_models.metadata.Metadata.objects.using('bizcred_db').get(account_type = 2,user__email = single_vendor)
        html += '<option value="{0}">{1}</option>'.format(str(company.user.email),str(company.org_name))
    return JsonResponse({'all_company':html})

@login_required
def ajax_company(request):
    vendor_company_email = str(request.GET.get('company_email'))
    sub_category = request.GET.getlist('sub_category[]')
    html = '<option class="GetProduct" selected value="00">All Product</option>'
    if vendor_company_email == '00' and '00' in sub_category:
        # print('geted all records')
        product_lists = store_models.Product.objects.using('veloce1_db').all()
        for product_list in product_lists:
            html += '<option value="{0}">{1}</option>'.format(str(product_list.pk),str(product_list.name))
    elif vendor_company_email != '00' and '00' in sub_category:
        # print('geted comapny wise records')
        product_lists = store_models.Product.objects.using('veloce1_db').filter(vendor__email = vendor_company_email)
        for product_list in product_lists:
            html += '<option value="{0}">{1}</option>'.format(str(product_list.pk),str(product_list.name))
    elif vendor_company_email == '00' and '00' not in sub_category:
        # print('geted product wise records')
        
        product_lists = store_models.Product.objects.using('veloce1_db').filter(sub_category__id__in = sub_category)
        for product_list in product_lists:
            html += '<option value="{0}">{1}</option>'.format(str(product_list.pk),str(product_list.name))
    else:
        print('both are present')
        product_lists = store_models.Product.objects.using('veloce1_db').filter(vendor__email = vendor_company_email,sub_category__id__in = sub_category)
        for product_list in product_lists:
            html += '<option value="{0}">{1}</option>'.format(str(product_list.pk),str(product_list.name))
    return JsonResponse({'all_product':html})
    

@login_required
def product_list(request):    
    cat = store_models.Category.objects.using('veloce1_db').all()
    sub_cat = store_models.SubCategory.objects.using('veloce1_db').all()
    comapanys_counts = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = 2).count()
    comapanys = bizcred_models.metadata.Metadata.objects.using('bizcred_db').filter(account_type = 2)
    
    company_lists = []
    for company in comapanys:
        company_dict ={}
        company_dict[str(company.user.email)] = str(company.org_name)
        company_lists.append(company_dict) 
    
    ##################### filters #####################
    filter_category = request.GET.get('category')
    filter_sub_category = request.GET.getlist('sub-category')
    filter_company = request.GET.get('company')
    filter_product_name = request.GET.get('product-name')

    # print(request.GET)
    all_product = store_models.Product.objects.using('veloce1_db').all().order_by('-id')
    if filter_category:
        if '00' in filter_category:
            all_product = all_product
        else:
            all_product = all_product.filter(Q(category__id = filter_category))
    
    if filter_sub_category:
        print(filter_sub_category)
        if '00' in filter_sub_category:
            all_product = all_product
        else:
            all_product = all_product.filter(Q(sub_category__id__in = filter_sub_category))
    
    if filter_company:
        if '00' in filter_company:
            all_product = all_product
        else:
            all_product = all_product.filter(vendor__email = filter_company)
            
    
    if filter_product_name:
        if '00' in filter_product_name :
            all_product = all_product
        else:
            all_product = all_product.filter(Q(id = int(filter_product_name)))
    
    page = request.GET.get('page', 1)
    paginator = Paginator(all_product, 10)
    
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
          
    context={
        'categories':cat,
        'sub_categories':sub_cat,
        'products':products,
        'company_lists':company_lists,
        'comapanys_counts':comapanys_counts,
        
        # kept filter after query fired
        'filter_categorys':filter_category,
        'filter_sub_categorys':filter_sub_category,
        'filter_companys':filter_company,
        'filter_product_names':filter_product_name,
    }
    return render(request,'backoffice/user-templates/product-list.html',context)

@login_required
def backoffice_users(request):
    if request.method == "POST":
        id = request.POST.get('id')
        status = request.POST.get('status')
        if status == 'deactivate':
            user =  User.objects.get(id = id)
            user.is_active = False
            user.save()
            users = User.objects.get(id = id)
            
            if users :
                messages = f'user with this email - {users.email} account is disabled'
                return JsonResponse({'alart_class':'success','messages':messages})
            else :
                messages = f'user with this email account is not disabled please try again'
                return JsonResponse({'alart_class':'danger','messages':messages})
            
        if status == 'activate':
            user =  User.objects.get(id = id)
            user.is_active = True
            user.save()
            users = User.objects.get(id = id)
             
            if users :
                messages = f'user with this email - {users.email} account is activate'
                return JsonResponse({'alart_class':'success','messages':messages})
            else :
                messages = f'user with this email account is not activate please try again'
                return JsonResponse({'alart_class':'danger','messages':messages})
        
    active_office_users = User.objects.filter(is_active = True)
    not_active_office_users = User.objects.filter(is_active = False)
    context ={
        'active_backoffice_users': active_office_users,
        'not_active_backoffice_users': not_active_office_users,
    }
    return TemplateResponse(request,'backoffice/admin-templates/backoffice-users.html',context)

from django.contrib.sessions.backends.db import SessionStore
@login_required
def view_profile(request,pk):
    print(request.session)
    user = User.objects.filter(pk = pk)
    # print(user)
    context ={
        'user_profiles': user,
    }
    return render(request,'backoffice/admin-templates/view-profile.html',context)

@login_required
def edit_profile(request,pk):
    error = ''
    success = ''
    user = User.objects.get(pk = pk)
    user_profile = user.profile
    user_credentials = user.usercredentials
    initial = {
        "first_name": user.first_name,
        "last_name": user.last_name,
        "email": user.email,    
        "pin_code": user_profile.pin_code,
        "unit_number": user_profile.unit_number,
        "street_address": user_profile.street_address,
        "city": user_profile.city,
        'state':user_profile.state,
        "tel_number": user_profile.tel_number,
        "user_type": user_credentials.user_type,
        "user_position": user_profile.user_position,
               }
    form = backoffice_forms.auth.EditDetailsForm(initial = initial)
    
    if request.method == 'POST':
        form = backoffice_forms.auth.EditDetailsForm(request.POST)
        if form.is_valid():
            password = form.cleaned_data.get('password')
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            pin_code = form.cleaned_data.get('pin_code')
            unit_number = form.cleaned_data.get('unit_number')
            street_address = form.cleaned_data.get('street_address')
            city = form.cleaned_data.get('city')
            state = form.cleaned_data.get('state')
            tel_number = form.cleaned_data.get('tel_number')
            user_type = form.cleaned_data.get('user_type')
            user_position = form.cleaned_data.get('user_position')
            
            user = User.objects.get(pk = pk)
            user_profile = user.profile
            user_credentials = user.usercredentials
            
            if len(password) >= 8 :
                user.first_name = first_name
                user.last_name = last_name
                user.password = make_password(password)
                user.save()
            else:
                user.first_name = first_name
                user.last_name = last_name
                user.save()
                
            user_profile.pin_code = pin_code  
            user_profile.unit_number = unit_number  
            user_profile.street_address = street_address  
            user_profile.city = city  
            user_profile.state = state  
            user_profile.tel_number = tel_number  
            user_profile.user_position = user_position
            user_profile.save()
            
            user_credentials.user_type = user_type
            user_credentials.save()
            messages.success(request, "User with this "+ user.email + " has updated profile successfully!")
            return redirect('backoffice:backoffice_users')
        else:
            error="invalid credentials !!"
                
    context={
        'form':form,
        'pk':pk,
        'error':error,
        'success': success,
    }
    return render(request,'backoffice/admin-templates/edit-profile.html',context)


def check_file_ext(req):
    validate_file_ext = True
    valid_extensions_image = ['.jpg', '.jpeg', '.png', '.gif']
    valid_extensions_video = ['.mp4', '.mov', '.avi', '.wmv']
    error = ''
    image_video_dict = req.FILES.keys()
    if 'image' in image_video_dict and 'demo_video' in image_video_dict:
        image_ext = True
        for field_name in req.FILES.keys():
            for formField in req.FILES.getlist(field_name):
                if field_name == 'image':
                    ext_image = formField.name.split('.')[1]
                    file_ext_image = "." + ext_image
                    if file_ext_image not in valid_extensions_image:
                        image_ext = False
                        error = "Invalid file extension!, Please select from " + ', '.join(valid_extensions_image)

                elif field_name == 'demo_video':
                    ext_video = formField.name.split('.')[1]
                    file_ext_video = "." + ext_video
                    if file_ext_video not in valid_extensions_video:
                        validate_file_ext = False
                        if not image_ext:
                            error = mark_safe(
                                "Invalid image and video extension!<br><br> Please select image from" + ', '.join(
                                    valid_extensions_image) + " <br> Please select video from" + ', '.join(
                                    valid_extensions_video))
                            break
                        else:
                            error = "Invalid video extension!, Please select from " + ', '.join(valid_extensions_video)
                            break
                    if not image_ext:
                        validate_file_ext = False
                        error = "Invalid image extension!, Please select from " + ', '.join(valid_extensions_image)
                        break
            if not validate_file_ext:
                break
    elif 'image' in image_video_dict:
        for field_name in req.FILES.keys():
            for formField in req.FILES.getlist(field_name):
                if field_name == 'image':
                    ext_image = formField.name.split('.')[1]
                    file_ext_image = "." + ext_image
                    if file_ext_image not in valid_extensions_image:
                        validate_file_ext = False
                        error = "Invalid file extension!, Please select from " + ', '.join(valid_extensions_image)
                        break
            if not validate_file_ext:
                break
    elif 'demo_video' in image_video_dict:
        for field_name in req.FILES.keys():
            for formField in req.FILES.getlist(field_name):
                if field_name == 'demo_video':
                    ext_video = formField.name.split('.')[1]
                    file_ext_video = "." + ext_video
                    if file_ext_video not in valid_extensions_video:
                        validate_file_ext = False
                        error = "Invalid video extension!"
                        break
            if not validate_file_ext:
                break

    else:
        validate_file_ext = True
    context = {
        "status": validate_file_ext,
        "message": error
    }
    return context

@login_required
def get_company_as_vendor(request):
    company_users =  store_models.profile.Profile.objects.using('veloce1_db').filter(account_type = 2,is_complete=True,is_verified=True,completion_level__gte = 2,verification_level__gte = 2)
    company_emails_and_pk = []
    html = '<option selected disabled value=""> --- Select Company --- </option>'
    for company_user in company_users:
        company_dict = {
            'email':company_user.user.email,
            'pk': company_user.user.pk
        }
        company_emails_and_pk.append(company_dict)
    print('---->    ',company_emails_and_pk)
    
    for company_dictionary in company_emails_and_pk:
        try:
            company_query = bizcred_models.metadata.Metadata.objects.using('bizcred_db').get(account_type = 2,user__email = company_dictionary['email'])
            company_dictionary['company_name'] = str(company_query.org_name)
            html += '<option value="{0}">{1} ({2})</option>'.format(str(company_dictionary['pk']),str(company_dictionary['company_name']),str(company_dictionary['email']))
        except:
            pass

    return JsonResponse({'data':html})


@login_required
def category_create(request):
    error = ""
    success = ""
    form = store_forms.CategoryEditForm()
    if request.method == 'POST':
        form = store_forms.CategoryEditForm(request.POST, request.FILES)  
        if form.is_valid():
            form.save()
            messages.success(request,f'Category is Successfully Created !!')
            return redirect('backoffice:category_list')
        else:
            error="Category From is invalid Please enter Valid details or required fields !!"
    
    context = {
        'error':error,
        'success':success,
        'form':form,
    }
    return render(request,'backoffice/user-templates/category-create.html',context)

@login_required
def category_edit(request,slug):
    error = ""
    success = ""
    category_list = store_models.listings.Category.objects.using('veloce1_db').get(slug = slug)
    print(category_list)
    form = store_forms.CategoryEditForm(instance = category_list)
    
    if request.method == 'POST':
        form = store_forms.CategoryEditForm(request.POST, request.FILES,instance = category_list)  
        if form.is_valid():
            form.save()
            messages.success(request,f'Category is Successfully Updated !!')
            return redirect('backoffice:category_list')
        else:
            messages.error(request,f'Category From is invalid Please enter Valid details or required fields !!')
            # error="Category From is invalid Please enter Valid details or required fields !!"
            return redirect('backoffice:category_edit',slug=slug)
    
    context = {
        'error':error,
        'success':success,
        'slug':slug,
        'form':form,
        # 'category_list':category_list
    }
    return render(request,'backoffice/user-templates/category-create.html',context)

@login_required
def category_list(request):
    category_lists = store_models.listings.Category.objects.using('veloce1_db').all()
    total_categorys = category_lists.count()
    context = {
        'category_lists':category_lists,
        'total_categorys':total_categorys,
    }
    return render(request,'backoffice/user-templates/category-list.html',context)

@login_required
def category_delete(request,slug):
    category = store_models.listings.Category.objects.using('veloce1_db').get(slug = slug)
    subcategory = store_models.listings.SubCategory.objects.using('veloce1_db').filter(category_id = category.id)
    
    if subcategory.count() == 0:
        category.delete()
        messages.success(request,'Category deleted Successfully.')
    else:
        messages.error(request,'Category has SubCategory Please delete It. <a href="">click me</a> to delete the Subcategory !!')
    return redirect('backoffice:category_list')




@login_required
def subcategory_create(request):
    error = ""
    success = ""
    form = store_forms.SubCategoryEditForm()
    if request.method == 'POST':
        form = store_forms.SubCategoryEditForm(request.POST, request.FILES)  
        if form.is_valid():
            form.save()
            messages.success(request,'SubCategory Create Successfully.')
            return redirect('backoffice:subcategory_list')
        else:
            # error="SubCategory From is invalid Please enter Valid details or required fields !!"
            messages.error(request,'SubCategory From is invalid Please enter Valid details or required fields !!')
    
    context = {
        'error':error,
        'success':success,
        'form':form,
    }
    return render(request,'backoffice/user-templates/subcategory-create.html',context)

@login_required
def subcategory_edit(request,slug):
    error = ""
    success = ""
    subcategory_list = store_models.listings.SubCategory.objects.using('veloce1_db').get(slug = slug)
    print(subcategory_list)
    form = store_forms.SubCategoryEditForm(instance = subcategory_list)
    
    if request.method == 'POST':
        form = store_forms.SubCategoryEditForm(request.POST, request.FILES,instance = subcategory_list)  
        if form.is_valid():
            form.save()
            messages.success(request,'SubCategory Updated Successfully.')
            return redirect('backoffice:subcategory_list')
        else:
            error="SubCategory From is invalid Please enter Valid details or required fields !!"
    
    context = {
        'error':error,
        'success':success,
        'slug':slug,
        'form':form,
        # 'category_list':category_list
    }
    return render(request,'backoffice/user-templates/subcategory-create.html',context)


import datetime
@login_required
def subcategory_list(request):
    Subcategory_lists = store_models.listings.SubCategory.objects.using('veloce1_db').all()
    total_subcategorys = Subcategory_lists.count()
    # print(datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
    
    context = {
        'Subcategory_lists':Subcategory_lists,
        'total_subcategorys':total_subcategorys,
    }
    return render(request,'backoffice/user-templates/subcategory-list.html',context)

@login_required
def subcategory_delete(request,slug):
    subcategory = store_models.listings.SubCategory.objects.using('veloce1_db').get(slug = slug)
    product = store_models.listings.Product.objects.using('veloce1_db').filter(category_id = subcategory.category.id,sub_category_id = subcategory.id)
    # print(product.count())
    if product.count() == 0:
        subcategory.delete()
        messages.success(request,'SubCategory deleted Successfully.')
    else:
        messages.error(request,'SubCategory has Product Please delete It. <a href="">click me</a> to delete the Product !!')
    return redirect('backoffice:subcategory_list')
    

@login_required
def create_product(request):
    error = ''
    if request.method == 'POST':
        product_form = store_forms.ProductForm(request.POST, request.FILES)
        price_form = store_forms.PriceStructureForm(request.POST)
        get_file_check_status = check_file_ext(request)
        if get_file_check_status['status']:
            if product_form.is_valid() and price_form.is_valid():
                request_user = int(request.POST.get('vendor'))
                product = product_form.save(commit=False)
                request_users = store_models.auth_user.AuthUser.objects.using('veloce1_db').get(pk = request_user)
                product.vendor = request_users
                product.save()
                product_form.save_m2m()
                for field_name in request.FILES.keys():
                    for formField in request.FILES.getlist(field_name):
                        if field_name == 'image':
                            store_models.ProductMedia.objects.using('veloce1_db').create(image=formField, product=product)
                        elif field_name == 'demo_video':
                            store_models.ProductMedia.objects.using('veloce1_db').create(demo_video=formField, product=product)
                check_for_price = len(request.POST.getlist('frequency'))
                if check_for_price > 0:
                    for i in range(check_for_price):
                        amt_before_tax = int(request.POST.getlist('amount')[i]) - int(
                            (request.POST.getlist('disc_amt')[i]))
                        store_models.PriceStructure.objects.using('veloce1_db').create(product=product,
                                                             frequency=request.POST.getlist('frequency')[i],
                                                             label=request.POST.getlist('label')[i],
                                                             amount=request.POST.getlist('amount')[i],
                                                             disc_per=request.POST.getlist('disc_per')[i],
                                                             disc_amt=request.POST.getlist('disc_amt')[i],
                                                             amt_before_tax=amt_before_tax,
                                                             taxes=request.POST.getlist('taxes')[i],
                                                             final_amt=request.POST.getlist('final_amt')[i],
                                                             currency=request.POST.getlist('currency')[i],
                                                             is_visible_home=0)
                else:
                    pass
                if "is_this_physical_product" in request.POST and request.POST['is_this_physical_product']:
                    delivery_form = store_forms.ProductDeliveryForm(request.POST, request.FILES)
                    product_delivery = delivery_form.save(commit=False)
                    product_delivery.product = product
                    product_delivery.save()
                messages.success(request, "Product add successfully!")
                return redirect('backoffice:product_list')
        else:
            error = get_file_check_status['message']
    else:
        product_form = store_forms.ProductForm()
        price_form = store_forms.PriceStructureForm()
    return render(request, 'backoffice/user-templates/product-create.html',
                  {'form': product_form, 'price_form': price_form, 'error': error})

@login_required
def edit_product(request,pk):
    get_product_obj = get_object_or_404(store_models.Product, pk=pk)
    check_product_delivery = store_models.PackagingDeliveryDetails.objects.using('veloce1_db').filter(product=get_product_obj)
    price_form_lst = []
    af_sales = None
    af_warranty = None
    error = ''
    for price_obj in get_product_obj.product_prices.all():
        price_form = store_forms.PriceStructureForm(instance=price_obj)
        price_form_lst.append(price_form)
    if request.method == 'POST':
        form = store_forms.ProductEditForm(request.POST, instance=get_product_obj)
        get_file_check_status = check_file_ext(request)
        if get_file_check_status['status']:
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^", request.POST)
            if form.is_valid():
                # print("^^^^^^^^^^^^^^^^^^^^^^^^^^", request.FILES)
                product = form.save(commit=True)
                user_request = get_product_obj.vendor
                product.vendor = user_request
                product.save()
                # form.save_m2m()
                for field_name in request.FILES.keys():
                    for formField in request.FILES.getlist(field_name):
                        if field_name == 'image':
                            store_models.ProductMedia.objects.using('veloce1_db').create(image=formField, product=product)
                        elif field_name == 'demo_video':
                            store_models.ProductMedia.objects.using('veloce1_db').create(demo_video=formField, product=product)
                check_for_price = len(request.POST.getlist('frequency'))
                if check_for_price > 0:
                    for price_obj in get_product_obj.product_prices.all():
                        price_obj.delete()
                    for i in range(check_for_price):
                        amt_before_tax = int(request.POST.getlist('amount')[i]) - int(
                            (request.POST.getlist('disc_amt')[i]))
                        store_models.PriceStructure.objects.using('veloce1_db').create(product=product,
                                                                frequency=request.POST.getlist('frequency')[i],
                                                                label=request.POST.getlist('label')[i],
                                                                amount=request.POST.getlist('amount')[i],
                                                                disc_per=request.POST.getlist('disc_per')[i],
                                                                disc_amt=request.POST.getlist('disc_amt')[i],
                                                                amt_before_tax=amt_before_tax,
                                                                taxes=request.POST.getlist('taxes')[i],
                                                                final_amt=request.POST.getlist('final_amt')[i],
                                                                currency=request.POST.getlist('currency')[i])
                if "is_this_physical_product" in request.POST and request.POST['is_this_physical_product']:
                    if check_product_delivery.count() > 0:
                        product_delivery_obj = store_models.PackagingDeliveryDetails.objects.using('veloce1_db').get(product=get_product_obj)
                        delivery_form = store_forms.ProductDeliveryForm(request.POST, request.FILES,
                                                                    instance=product_delivery_obj)
                        try:
                            product_delivery = delivery_form.save(commit=False)
                            product_delivery.product = product
                            product_delivery.save()
                        except:
                            messages.error(request,"your product is not upload Please fill the Packaging and Delivery Details  !!")
                            return redirect('backoffice:edit_product',pk=pk)
                    else:
                        try:
                            delivery_form = store_forms.ProductDeliveryForm(request.POST, request.FILES)
                            product_delivery = delivery_form.save(commit=False)
                            product_delivery.product = product
                            product_delivery.save()
                        except:
                            messages.error(request,"your product is not upload Please fill the Packaging and Delivery Details  !!")
                            return redirect('backoffice:edit_product',pk=pk)
                else:
                    if check_product_delivery.count() > 0:
                        check_product_delivery.delete()
                messages.success(request, get_product_obj.name + " updated successfully!")
                return redirect('backoffice:product_list')
        else:
            error = get_file_check_status['message']
    else:
        form = store_forms.ProductEditForm(instance=get_product_obj)
        af_sales = get_product_obj.after_sales_service_provided
        af_warranty = get_product_obj.after_warranty_service
        
    context= {'form': form, 'price_form_list': price_form_lst, 'af_sales': af_sales,
                    'af_warranty': af_warranty, 'error': error, 'pk': pk}
    return render(request,'backoffice/user-templates/product-create.html',context)

def get_product_delivery_form(request):
    form = store_forms.ProductDeliveryForm()
    context = {
        'form': form.as_p()
    }
    return JsonResponse(context)

@login_required
def delete_image_by_id(request):
    col_id = request.GET['id']
    delete_from_model = request.GET['delete_from_model']
    print(col_id, delete_from_model)
    try:
        if delete_from_model == 'product':
            img = store_models.ProductMedia.objects.using('veloce1_db').get(id=col_id).delete()
        else:
            bill = store_models.BookSale.objects.using('veloce1_db').get(inquiry_id=col_id).upload_bill.delete(save=False)
    except:
        pass

    context = {
        "status": True,
        "id": col_id,
    }
    return JsonResponse(context)

@login_required
def get_delivery_detail_by_product_id(request):
    try:
        product_id = request.GET['product_id']
        product_delivery_obj = store_models.PackagingDeliveryDetails.objects.using('veloce1_db').filter(product_id=product_id)
        if product_delivery_obj.count() > 0:
            context = {
                "status": True,
                "data": list(product_delivery_obj.values())
            }
            return JsonResponse(context, safe=False)
        else:
            context = {
                "status": False
            }
            return JsonResponse(context)
    except Exception as e:
        context = {
            "status": False
        }
        return JsonResponse(context)

def get_price_form(request):
    form = store_forms.PriceStructureForm()
    context = {
        'form': form.as_p()
    }
    return JsonResponse(context)

def make_image_as_feature_img(request, pk):
    try:
        get_images_data = store_models.ProductMedia.objects.using('veloce1_db').using('veloce1_db').get(pk=pk)
        product_obj = get_images_data.product
        store_models.ProductMedia.objects.using('veloce1_db').filter(product=product_obj).update(is_feature_image=0)
        get_images_data.is_feature_image = True
        get_images_data.save()
        context = {
            "status": True
        }
    except Exception as err:
        context = {
            "status": False
        }
    return JsonResponse(context)

@login_required
def get_sub_categories_by_cat_id(request):
    try:
        sub_cat_list = []
        cat_id = request.GET['cat_id']
        sub_categories = store_models.SubCategory.objects.filter(category_id=cat_id)
        for data in sub_categories:
            cat_context = {
                'id': data.id,
                'name': data.name
            }
            sub_cat_list.append(cat_context)
        html = '<option value selected>---------</option>'
        for item in sub_cat_list:
            html += '<option value="{0}">{1}</option>'.format(item['id'], item['name'])
        context = {
            "status": True,
            'sub_category': html
        }
    except Exception as e:
        context = {
            "status": False
        }
    return JsonResponse(context)

@login_required
def get_product_by_sub_cat(request):
    try:
        sub_cat_product_list = []
        sub_cat_id = request.GET['sub_cat_id']
        sub_categories_product = store_models.Product.objects.filter(sub_category_id=sub_cat_id)
        for data in sub_categories_product:
            cat_context = {
                'id': data.id,
                'name': data.name
            }
            sub_cat_product_list.append(cat_context)
        # html = '<option value selected>---------</option>'
        # for item in sub_cat_product_list:
        #     html += '<option value="{0}">{1}</option>'.format(item['id'], item['name'])
        context = {
            "status": True,
            'sub_category_products': sub_cat_product_list
        }
    except Exception as e:
        context = {
            "status": False
        }
    return JsonResponse(context)

def forward_inq(request): 
    return HttpResponse('DONE')       