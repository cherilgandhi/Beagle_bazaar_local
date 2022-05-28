from django import forms
from backoffice import enums
from backoffice.validators import *
from backoffice.forms.base import *
from django.contrib.auth import get_user_model
User = get_user_model()


class RegisterForm(BaseForm):
    first_name = forms.CharField(
        required=True,
        max_length=50,
        min_length=1,
        validators=[name_validator],
        label="First Name <small class=asterisk>*</small>",
        widget=forms.TextInput(attrs={'class':'form-control'})
    )

    last_name = forms.CharField(
        required=True,
        max_length=50,
        min_length=1,
        validators=[name_validator],
        label="Last Name <small class=asterisk>*</small>",
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    
    email = forms.EmailField(
        required=True,
        max_length=60,
        label="Email <small class=asterisk>*</small>",
        widget=forms.EmailInput(attrs={'class':'form-control'})
        # validators=[validators.EmailValidator()]
    )
    
    pin_code = forms.CharField(required=True,
                               validators = [pin_validator],
                               label="Pin Code <small class=asterisk>*</small>",
                               widget=forms.TextInput(attrs={'class':'form-control','title': 'Pin Code Detail...!'}))
    
    unit_number = forms.CharField(required=True,
                                  label="Floor/Unit <small class=asterisk>*</small>",
                                  widget=forms.TextInput(attrs={'class':'form-control','title': 'Floor/Unit Detail...!'}))
    street_address = forms.CharField(required=True,
                                     label="Street Address <small class=asterisk>*</small>",
                                     widget=forms.TextInput(attrs={'class':'form-control','title': 'Street Address Detail...!'}))
   
    city = forms.CharField(required=True,
                           label="City <small class=asterisk>*</small>",
                           widget=forms.TextInput(attrs={'class':'form-control','title': 'City Detail...!'}))
    state = forms.ChoiceField(choices=enums.to_choices(enums.IndiaStates), required=True,
                              label="State <small class=asterisk>*</small>",
                              widget=forms.Select(attrs={'class':'form-control','title': 'State Detail...!'}))
    
    tel_number = forms.CharField(required=True,
                                 validators= [phone_validator],
                                 widget=forms.TextInput(attrs={'class':'form-control','title': 'Telephone number...!'}),
                                 label="Contact No.",)
    
    user_type = forms.ChoiceField(choices=enums.to_choices(enums.AccountTypes), required=True,
                              label="Account Type <small class=asterisk>*</small>",
                              widget=forms.Select(attrs={'class':'form-control','title': 'Credentials Detail...!'}))
    
    password = forms.CharField(
        required=True,
        widget=forms.PasswordInput(attrs={'class':'form-control',}),
        label="Password <small class=asterisk>*</small>",
        validators=[password_validator],
    )

    confirm_password = forms.CharField(
        required=True,
        label="Confirm Password <small class=asterisk>*</small>",
        widget=forms.PasswordInput(attrs={'class':'form-control',}),
        validators=[password_validator],
    )

    user_position = forms.CharField(required=True,
                           label="Position In Company <small class=asterisk>*</small>",
                           widget=forms.TextInput(attrs={'class':'form-control','title': 'User Position Detail...!'}))
    
    half = ['first_name', 'last_name','email','password','confirm_password','pin_code','city','state','tel_number','user_type','user_position']
    # half = ['first_name', 'last_name','email','password','confirm_password',]

    def __init__(self, *args, **kwargs):
        super(RegisterForm, self).__init__(*args, **kwargs)
        
        
class LoginForm(BaseForm):
    username = forms.EmailField(
        required=True,
        max_length=60,
        label="Email <small class=asterisk>*</small>",
        widget=forms.EmailInput(attrs={'class':'form-control','placeholder':'Email'})
        # validators=[validators.EmailValidator()]
    )
    
    password = forms.CharField(
        required=True,
        widget=forms.PasswordInput(attrs={'class':'form-control','placeholder':'Password'}),
        label="Password <small class=asterisk>*</small>",
        validators=[password_validator],
    )
    
    def __init__(self, *args, **kwargs):
        super(LoginForm, self).__init__(*args, **kwargs)
        
        

class EditDetailsForm(BaseForm):
    first_name = forms.CharField(
        required=True,
        max_length=50,
        min_length=1,
        validators=[name_validator],
        label="First Name <small class=asterisk>*</small>",
        widget=forms.TextInput(attrs={'class':'form-control'})
    )

    last_name = forms.CharField(
        required=True,
        max_length=50,
        min_length=1,
        validators=[name_validator],
        label="Last Name <small class=asterisk>*</small>",
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    
    email = forms.EmailField(
        required=True,
        max_length=60,
        label="Email <small class=asterisk>*</small>",
        widget=forms.EmailInput(attrs={'class':'form-control','readonly':'readonly'})
        # validators=[validators.EmailValidator()]
    )
    
    pin_code = forms.CharField(required=True,
                               validators = [pin_validator],
                               label="Pin Code <small class=asterisk>*</small>",
                               widget=forms.TextInput(attrs={'class':'form-control','title': 'Pin Code Detail...!'}))
    
    unit_number = forms.CharField(required=True,
                                  label="Floor/Unit <small class=asterisk>*</small>",
                                  widget=forms.TextInput(attrs={'class':'form-control','title': 'Floor/Unit Detail...!'}))
    street_address = forms.CharField(required=True,
                                     label="Street Address <small class=asterisk>*</small>",
                                     widget=forms.TextInput(attrs={'class':'form-control','title': 'Street Address Detail...!'}))
   
    city = forms.CharField(required=True,
                           label="City <small class=asterisk>*</small>",
                           widget=forms.TextInput(attrs={'class':'form-control','title': 'City Detail...!'}))
    state = forms.ChoiceField(choices=enums.to_choices(enums.IndiaStates), required=True,
                              label="State <small class=asterisk>*</small>",
                              widget=forms.Select(attrs={'class':'form-control','title': 'State Detail...!'}))
    
    tel_number = forms.CharField(required=True,
                                 validators= [phone_validator],
                                 widget=forms.TextInput(attrs={'class':'form-control','title': 'Telephone number...!'}),
                                 label="Contact No.",)
    
    user_type = forms.ChoiceField(choices=enums.to_choices(enums.AccountTypes), required=True,
                              label="Account Type <small class=asterisk>*</small>",
                              widget=forms.Select(attrs={'class':'form-control','title': 'Credentials Detail...!'}))
    
    password = forms.CharField(
        required=False,
        widget=forms.PasswordInput(attrs={'class':'form-control',}),
        label="Password <small class=asterisk>*</small>",
        validators=[password_validator],
    )

    user_position = forms.CharField(required=True,
                           label="Position In Company <small class=asterisk>*</small>",
                           widget=forms.TextInput(attrs={'class':'form-control','title': 'User Position Detail...!'}))
    
    half = ['first_name','email' ,'last_name','password','unit_number','street_address','pin_code','city','state','tel_number','user_type','user_position']

    def __init__(self, *args, **kwargs):
        super(EditDetailsForm, self).__init__(*args, **kwargs)