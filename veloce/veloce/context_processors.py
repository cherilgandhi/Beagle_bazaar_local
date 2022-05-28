from django.conf import settings
from django.contrib.sites.shortcuts import get_current_site


def all_url(request):
    current_site = get_current_site(request)
    context={
        'OAUTH_URL':settings.OAUTH_URL,
        'CURRENT_URL': current_site.domain,
        'MARKET_URL':settings.MARKET_URL,
        'CLIENT_ID': settings.SOCIAL_AUTH_VAUTH_KEY,
    }
    return context
