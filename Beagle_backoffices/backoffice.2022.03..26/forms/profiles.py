from django import forms
from backoffice import enums
from backoffice import models


class ProfileForm(forms.Form):
    unit_number = forms.CharField(required=True,
                                  label="Floor/Unit <small class=asterisk>*</small>",
                                  widget=forms.TextInput(attrs={'title': 'Floor/Unit Detail...!'}))
    street_address = forms.CharField(required=True,
                                     label="Street Address <small class=asterisk>*</small>",
                                     widget=forms.TextInput(attrs={'title': 'Street Address Detail...!'}))
    tel_number = forms.CharField(required=True,
                                 widget=forms.TextInput(attrs={'title': 'Telephone number...!'}),
                                 label="Telephone No.",
                                 help_text='Note : If Multiple telephone no then add comma separated ...!')
    pin_code = forms.CharField(required=True,
                               label="Pin Code <small class=asterisk>*</small>",
                               widget=forms.TextInput(attrs={'title': 'Pin Code Detail...!'}))
    city = forms.CharField(required=True,
                           label="City <small class=asterisk>*</small>",
                           widget=forms.TextInput(attrs={'title': 'City Detail...!'}))
    state = forms.ChoiceField(choices=enums.to_choices(enums.IndiaStates), required=True,
                              label="State <small class=asterisk>*</small>",
                              widget=forms.Select(attrs={'title': 'State Detail...!'}))
    
    
    def __init__(self, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)


    class Meta:
        model = models.profiles.Profile
        exclude = ['user',]