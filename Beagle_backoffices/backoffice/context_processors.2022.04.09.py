from django.conf import settings
from django.contrib.sites.shortcuts import get_current_site
from backoffice import models as backoffice_modules  

def all_url(request):
    current_site = get_current_site(request)
    try:
        if request.user.is_authenticated:
            credentials = backoffice_modules.credentials.UserCredentials.objects.using('auth_db').get(user = request.user)
        else:
            credentials ={}
        
        context = {
        'OAUTH_URL': settings.OAUTH_URL,
        'MARKET_URL': settings.MARKET_URL,
        'FINTECH_URL': settings.FINTECH_URL,
        'CURRENT_URL': current_site.domain,
        'credentials' : credentials,
    }
    except:
        context = {
        'OAUTH_URL': settings.OAUTH_URL,
        'MARKET_URL': settings.MARKET_URL,
        'FINTECH_URL': settings.FINTECH_URL,
        'CURRENT_URL': current_site.domain,
    }
    return context