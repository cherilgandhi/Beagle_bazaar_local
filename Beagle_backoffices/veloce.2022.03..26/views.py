from django.http.response import HttpResponse
from django.shortcuts import render
from django.http import HttpResponse

#-----------------------------------------------------------------------|
# bizcred data access                                                  #|
                                                                       #|
from bizcred import models as bizcred_models                           #| 
from bizcred.models import auth_user as bizcred_user                   #|
#-----------------------------------------------------------------------+
# store data access                                                    #|
                                                                       #|
from veloce.models import auth_user as store_user # AuthUser      #|
from veloce.models import profile as store_profile   # Profile         #|
from veloce import models as store_models                              #|  
# auth      -----   VeloceUser, RecentlyVisited                        # <------------------------------------------------|
# listings  -----   Category, SubCategory, Product, PriceStructure, ProductMedia, ProductRating, ProductInquiry,         #|
                        # PackagingDeliveryDetails, Sale, Voucher, DealersGivenFinanceScheme, BookSale, BookSaleDetails, #|
                        # GeneralRewardPoints, SpecialRewardPoints, TransactionRewardDetails, DealerSelection,           #|
                        # SelectProductByDealer, QuestionAnswer                                                          #|
#------------------------------------------------------------------------------------------------------------------------------------------|                       
# fintech data access                                                                                                                     #|
from veloces.models import auth_user as fintech_user # AuthUser                                                                      #|
from veloces.models import profile as fintech_profile  # Profile, GeneralInfo, EmploymentInfo, InstitutionInfo,KycDocuments, Address      #|
from veloces import models as fintech_models                                                                                              #|
# loan      -----   Loan, Lender                                                                                                          #|
# application ---- VeloceApplication, ReviewedVeloceApplication, ApplicationStep1, InvoiceStep1, ApplicationStep2,                         +----+
                                       # GeneralVeloceMarkup, DealerSpecialVeloceMarkup, ApplicationSpecialVeloceMarkup, FinanceSchemeConfig,  #|
                                       # ApplicationPaymentStatus                                                                              #|
#-----------------------------------------------------------------------------------------------------------------------------------------------|


# Create your views here.
def home(request):
    # que = store_profile.Profile.objects.using('veloce1_db').filter(user__username = request.user)
    # print('$$$$$$$$$$$$$$$$$$$$$$$$$',que)
    
    # que = store_user.AuthUser.objects.using('veloce1_db').filter(username = request.user)
    # print('$$$$$$$$$$$$$$$$$$$$$$$$$',que)
    return HttpResponse('this is first page veloce')
