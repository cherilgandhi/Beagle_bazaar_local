from backoffice import models as backoffice_modules
from django.contrib.auth import get_user_model
User = get_user_model()

def register(form):
    password = form.cleaned_data.get('password')
    email = form.cleaned_data.get('email')
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
    

# def check_credentials():
    # return 