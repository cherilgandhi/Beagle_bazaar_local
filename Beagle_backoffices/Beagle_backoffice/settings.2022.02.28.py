"""
Django settings for Beagle_backoffice project.

Generated by 'django-admin startproject' using Django 4.0.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from pathlib import Path
import os
# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-jygk-z2@dr0x#7mnzim@7b639bc(nw*53h0&y=27l7f00(qcan'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['192.168.0.20','127.0.0.1','216.48.178.22','beaglebazaar.com','www.beaglebazaar.com']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'widget_tweaks',
    'backoffice',
    'bizcred.apps.BizcredConfig',
    'veloce.apps.VeloceConfig',
    'veloces.apps.VelocesConfig',
]


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Beagle_backoffice.urls'

TEMPLATES_DIRS = os.path.join(BASE_DIR,'templates')
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATES_DIRS,],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'backoffice.context_processors.all_url',

            ],
        },
    },
]

WSGI_APPLICATION = 'Beagle_backoffice.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        },
    'auth_db': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'beagle_backoffice',
        'USER': 'admin',
        'PASSWORD': 'Postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    },
    'bizcred_db': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'beagle_bizcred',
        'USER': 'admin',
        'PASSWORD': 'Postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    },
    'veloce1_db': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'beaglebazaar',
        'USER': 'admin',
        'PASSWORD': 'Postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    },
    'veloce2_db': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'beagle_fintech',
        'USER': 'admin',
        'PASSWORD': 'Postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    },
}




# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql',
#         'NAME': 'beagle_backoffice',
#         'USER': 'admin',
#         'PASSWORD': 'Postgres',
#         'HOST': 'localhost',
#         'PORT': '5432',
#     }
# }



DATABASE_ROUTERS = ['routers.db_routers.AuthRouter', 
                    'routers.db_routers.BizcredConfig',
                    ]


LOGIN_URL = '/signin/'

# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators



AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# OAUTH_URL = 'http://192.168.0.20:7004'
# MARKET_URL = 'http://192.168.0.20:7002'
# FINTECH_URL = 'http://192.168.0.20:7003'


MARKET_URL = 'http://beaglebazaar.com'
FINTECH_URL = 'http://beaglebazaar.com:5002'
OAUTH_URL = 'http://beaglebazaar.com:5003'


EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'beaglebazaar@gmail.com'
EMAIL_HOST_PASSWORD = 'pgaxdpplnopmxtne'
ADMIN_EMAILS = ['beaglebazaar@gmail.com']

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = [
    BASE_DIR / "static",
]
# STATIC_ROOT = os.path.join(BASE_DIR,'static')

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR,'media')

# BAZAAR_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# BAZAAR_FILE_DIR = os.path.abspath(os.path.join(BAZAAR_DIR,'../veloce-store/veloce/static/veloce-store/uploaded-bills/'))

# MEDIA_URL = '/media/'
# MEDIA_ROOT = os.path.join(BAZAAR_DIR,'media')


# Beagle\ Bazaar/veloce-store/veloce/static/veloce-store/uploaded-bills/

# SESSION_COOKIE_AGE = 360

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


import os
from django.contrib.messages import constants as messages


MESSAGE_TAGS = {
        messages.DEBUG: 'alert-secondary',
        messages.INFO: 'alert-info',
        messages.SUCCESS: 'alert-success',
        messages.WARNING: 'alert-warning',
        messages.ERROR: 'alert-danger',
 }
