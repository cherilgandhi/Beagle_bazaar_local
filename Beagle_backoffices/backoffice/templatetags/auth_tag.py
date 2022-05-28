import json
from datetime import datetime, timezone
from backoffice import enums
import requests
from django.conf import settings
from django.db.models import Sum, Max
from veloce import models
from bizcred import models as bizcred_models
from bizcred.modules import base
from bizcred import form_map
from django import template
register = template.Library()


@register.filter
def related_deltails(obj, epk):
    epk = int(epk)
    return obj.get_status(epk)


@register.filter
def instance_template_tag(obj,user):
    return base.Module.instances(obj, user)

@register.filter
def lower_replace(value):
    return value.lower().replace(" ","_")

@register.filter
def value_to_link(key):
    key = key.replace('Total ','').lower()
    key = key.replace(' ','-')
    return key

@register.filter
def user_set(form,user):
    return form(instance = user)

@register.filter
def get_status(user_id,status):
    user = bizcred_models.auth_user.AuthUser.objects.using('bizcred_db').get(id=user_id)
    meta = user.metadata  
    status = meta.get_status(int(status))
    return status

@register.simple_tag
def loop_index(val=None):
    return val-1

@register.filter
def instance_template_tag2(obj,user):
    index = 0
    module = base.Module.instance(obj, user)
    m = module[0]
    dict = module[1]
    field_name = dict.keys()
    return base.Module.instance(obj, user)

@register.filter
def form_instance_passing(form,target_user):
    return form(instance = target_user )

@register.filter
def instance_template_tag3(form,modules):
    index=1
    form(instance=modules.instance(modules,index-1)[0])
    return form

@register.filter
def form_filter(form,user):
    return None

@register.filter
def type_check(obj):
    return type(obj)

@register.filter
def str_to_int(obj):
    return int(obj)

@register.filter
def int_to_str(obj):
    return int(obj)


@register.filter
def str_to_int_list(obj):
    final_obj=[]
    [final_obj.append(int(e)) for e in obj] 
    return final_obj

@register.filter
def type_dict_access(obj):
    print(obj)
    return obj


@register.filter
def form_template_tag(obj,module,user):
    index = 0
    obj(instance = module.instance(user, index-1)[0])
    return base.Module.instance(obj, module)


# this is used for image path settings
@register.filter
def verify_url_of_market_or_backoffice(url):
    market_url = str(settings.MARKET_URL)
    offfice_url = str(settings.OFFICE_URL)
    url = str(url)
    
    split_url = url.split('/')
    if split_url[0] == 'backoffice':
        join_url = ' '.join(url.split('/')[0:])
        replace_url = join_url.replace(' ', '/')
        final_url = offfice_url+'/media/'+replace_url
        
    elif split_url[0] == 'veloce':
        join_url = ' '.join(url.split('/')[0:])
        replace_url = join_url.replace(' ', '/')
        final_url = market_url+'/media/'+replace_url

    return final_url


# this is used for image path settings
@register.filter
def else_contition_verify_url_of_market_or_backoffice(url):
    market_url = str(settings.MARKET_URL)
    offfice_url = str(settings.OFFICE_URL)
    url = str(url)
    
    split_url = url.split('/')
    if split_url[0] == 'backoffice':
        join_url = ' '.join(url.split('/')[0:])
        replace_url = join_url.replace(' ', '/')
        final_url = offfice_url+'/media/'+replace_url
        
    elif split_url[0] == 'veloce':
        join_url = ' '.join(url.split('/')[0:])
        replace_url = join_url.replace(' ', '/')
        final_url = market_url+'/media/'+replace_url
    else:
        final_url = url

    return final_url

# pagination
@register.simple_tag
def relative_url(value, field_name, urlencode=None):
    url = '?{}={}'.format(field_name, value)
    print(urlencode)
    if urlencode:
        querystring = urlencode.split('&')
        filtered_querystring = filter(lambda p: p.split('=')[0] != field_name, querystring)
        encoded_querystring = '&'.join(filtered_querystring)
        url = '{}&{}'.format(url,encoded_querystring)
        print(url)
    return url


@register.filter
def account_tyes_enums_filter(obj):
    obj = enums.AccountTypes(obj).name
    obj = obj.replace('_',' ')
    return obj

@register.filter
def calculate_product_amount_plus_qty(product_amount,qty):
    total_amount = 0
    total_amount = int(product_amount)* int(qty)
    return total_amount