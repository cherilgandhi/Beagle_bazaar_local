from bizcred.modules.general import GENERAL_MODULE
from bizcred.modules.phone import PHONE_MODULE
from bizcred.modules.aadhar import AADHAR_MODULE
from bizcred.modules.bank_statement import BANKSTATEMENT_MODULE
from bizcred.modules.bank import BANK_MODULE, Lender_Details_MODULE
from bizcred.modules.company_details import COMPANY_DETAILS_MODULE
from bizcred.modules.business_financial import BUSINESS_FINANCIAL_MODULE
from bizcred.modules.employment_details import EMPLOYMENT_DETAIL_MODULE
from bizcred.modules.gst import GST_MODULE, OPTIONAL_GST_MODULE
from bizcred.modules.itr import ITR_MODULE
from bizcred.modules.pan import PAN_MODULE
from bizcred.modules.identification import IDENTIFICATION_MODULE
# from bizcred.modules.financial_details import FINANCIAL_STATEMENTS_MODULE
from bizcred.modules.sanctioned_loans import SANCTIONED_LOANS_MODULE
from bizcred.modules.address import CURRENT_ADDRESS_MODULE, OFFICE_ADDRESS_MODULE
from bizcred.modules.additional_company_details import ADDITIONAL_COMPANY_DETAILS_MODULE, Auth_ADDITIONAL_COMPANY_DETAILS_MODULE
from bizcred.modules.related_company import RELATED_COMPANY_MODULE
from bizcred.enums import AccountType


FORM_MAP = {
    AccountType.CUSTOMER.value: [
        # Level 0
        GENERAL_MODULE,
        PHONE_MODULE,
        CURRENT_ADDRESS_MODULE,

        # Level 1
        # PAN_MODULE,
        # AADHAR_MODULE,
        # OPTIONAL_GST_MODULE,
        # Level 2
        IDENTIFICATION_MODULE,
        BANK_MODULE,
        ITR_MODULE,
        # FINANCIAL_STATEMENTS_MODULE,
        BUSINESS_FINANCIAL_MODULE,
        EMPLOYMENT_DETAIL_MODULE,
        BANKSTATEMENT_MODULE,
        SANCTIONED_LOANS_MODULE,
    ],
    AccountType.COMPANY.value: [
        # Level 0
        COMPANY_DETAILS_MODULE,
        GENERAL_MODULE,
        PHONE_MODULE,
        OFFICE_ADDRESS_MODULE,

        # Level 1
        # PAN_MODULE,
        # GST_MODULE,

        # Level 2
        ADDITIONAL_COMPANY_DETAILS_MODULE,
        Auth_ADDITIONAL_COMPANY_DETAILS_MODULE,
        # FINANCIAL_STATEMENTS_MODULE,
        # BANK_MODULE,
        
        # ITR_MODULE,
        # BUSINESS_FINANCIAL_MODULE,
        # BANKSTATEMENT_MODULE,
        # SANCTIONED_LOANS_MODULE,
        # RELATED_COMPANY_MODULE,
    ],
    AccountType.DEALER.value: [
        # Level 0
        COMPANY_DETAILS_MODULE,
        GENERAL_MODULE,
        PHONE_MODULE,
        OFFICE_ADDRESS_MODULE,

        # Level 1
        # PAN_MODULE,
        # GST_MODULE,

        # Level 2
        ADDITIONAL_COMPANY_DETAILS_MODULE,
        Auth_ADDITIONAL_COMPANY_DETAILS_MODULE,
        # FINANCIAL_STATEMENTS_MODULE,
        BANK_MODULE,
        ITR_MODULE,
        BUSINESS_FINANCIAL_MODULE,
        BANKSTATEMENT_MODULE,
        SANCTIONED_LOANS_MODULE,
        RELATED_COMPANY_MODULE,
    ],
    AccountType.LENDER.value: [
        # Level 0
        COMPANY_DETAILS_MODULE,
        GENERAL_MODULE,
        PHONE_MODULE,
        OFFICE_ADDRESS_MODULE,

        # Level 1
        # PAN_MODULE,
        # GST_MODULE,

        # Level 2
        ADDITIONAL_COMPANY_DETAILS_MODULE,
        Auth_ADDITIONAL_COMPANY_DETAILS_MODULE,
        # FINANCIAL_STATEMENTS_MODULE,
        Lender_Details_MODULE,
        BANK_MODULE
    ],
    AccountType.SERVICE_AGENT.value: [
        # Level 0
        GENERAL_MODULE,
        PHONE_MODULE,
        CURRENT_ADDRESS_MODULE,

        
        IDENTIFICATION_MODULE,
        BANK_MODULE,
    ],
    AccountType.DISTRIBUTOR.value: [
        # Level 0
        COMPANY_DETAILS_MODULE,
        GENERAL_MODULE,
        PHONE_MODULE,
        OFFICE_ADDRESS_MODULE,

        # Level 1
        # PAN_MODULE,
        # GST_MODULE,

        # Level 2
        ADDITIONAL_COMPANY_DETAILS_MODULE,
        Auth_ADDITIONAL_COMPANY_DETAILS_MODULE,
        # FINANCIAL_STATEMENTS_MODULE,
        Lender_Details_MODULE,
        BANK_MODULE
    ]
    
}

MASKS = {}  
for account_type in FORM_MAP:
    MASKS[account_type] = 0
    # print('--------------------------\n',account_type)
    
    for i, module in enumerate(FORM_MAP[account_type]):
        if not module.level > 1:
            # print('enter if condition', MASKS[account_type],'|=',(1 << i))
            MASKS[account_type] |= (1 << i)
            # print('i = level is less then < 1   ->',i)
            # print(not module.level > 1,'not module.level > 1') # it the module level is less then 1 then the masks is done
            # print('after bianary opeations',MASKS[account_type],'|=',(1 << i))
            # print('final value of MASKS[account_type] ->',MASKS[account_type],'\n')
            
    # print(MASKS)





# l=1
# z={}
# z[l] = 0
# for i in range(3):
#     z[l]|=(1<<i)
#     print(z[l],(1<<i))

# level=1
# masks={}
# masks[level] = 0
# model_of_level_1_count = 4
# for i in range(model_of_level_1_count):
#     masks[level] = masks[level]|(1<<i)
#     print(masks[level],(1<<i))
# print(masks)


