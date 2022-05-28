from enum import Enum

def human_readable(value):
    value = value.replace('__1__', '_/_')
    value = value.replace('__2__', '_-_')
    value = value.replace('__3__', ',_')
    value = value.split('_')
    value = [word[0:1].upper() + word[1:].lower() for word in value]
    value = ' '.join(value).strip()
    return value


def to_choices(e):
    e_dict = dict(e.__members__)
    return [(e_dict[k].value, human_readable(k)) for k in e_dict]


class Gender(Enum):
    SELECT = ''
    MALE = 1
    FEMALE = 2
    
class ImageUploadStatus(Enum):
    SELECT = ''
    BACKOFFICE = 1
    STORE = 2
    FINANCE = 3
    
    

class IndiaStates(Enum):
    SELECT = ''
    ANDAMAN_AND_NICOBAR_ISLANDS = 1
    ANDHRA_PRADESH = 2
    ARUNACHAL_PRADESH = 3
    ASSAM = 4
    BIHAR = 5
    CHANDIGARH = 6
    CHHATTISGARH = 7
    DADRA_AND_NAGAR_HAVELI = 8
    DAMAN_AND_DIU = 9
    DELHI = 10
    GOA = 11
    GUJARAT = 12
    HARYANA = 13
    HIMACHAL_PRADESH = 14
    JAMMU_AND_KASHMIR = 15
    JHARKHAND = 16
    KARNATAKA = 17
    KERALA = 18
    LADAKH = 19
    LAKSHADWEEP = 20
    MADHYA_PRADESH = 21
    MAHARASHTRA = 22
    MANIPUR = 23
    MEGHALAYA = 24
    MIZORAM = 25
    NAGALAND = 26
    ORISSA = 27
    PONDICHERRY = 28
    PUNJAB = 29
    RAJASTHAN = 30
    SIKKIM = 31
    TAMIL_NADU = 32
    TELANGANA = 33
    TRIPURA = 34
    UTTAR_PRADESH = 35
    UTTARAKHAND = 36
    WEST_BENGAL = 37




IndiaStateCodes = {
    "AN":"ANDAMAN_AND_NICOBAR_ISLANDS",
    "AP":"ANDHRA_PRADESH", 
    "AR":"ARUNACHAL_PRADESH", 
    "AS":"ASSAM", 
    "BR":"BIHAR",
    "CG":"CHANDIGARH",
    "CH":"CHHATTISGARH",
    "DN":"DADRA_AND_NAGAR_HAVELI",
    "DD":"DAMAN_AND_DIU",
    "DL":"DELHI",
    "GA":"GOA",
    "GJ":"GUJARAT",
    "HR":"HARYANA",
    "HP":"HIMACHAL_PRADESH",
    "JK":"JAMMU_AND_KASHMIR",
    "JH":"JHARKHAND",
    "KA":"KARNATAKA",
    "KL":"KERALA",
    "LA":"LADAKH",
    "LD":"LAKSHADWEEP",
    "MP":"MADHYA_PRADESH",
    "MH":"MAHARASHTRA",
    "MN":"MANIPUR",
    "ML":"MEGHALAYA",
    "MZ":"MIZORAM",
    "NL":"NAGALAND",
    "OR":"ORISSA",
    "PY":"PONDICHERRY",
    "PB":"PUNJAB",
    "RJ":"RAJASTHAN",
    "SK":"SIKKIM",
    "TN":"TAMIL_NADU",
    "TS":"TELANGANA",
    "TR":"TRIPURA",
    "UP":"UTTAR_PRADESH",
    "UK":"UTTARAKHAND",
    "WB":"WEST_BENGAL"
    }

class AccountTypes(Enum):
    SELECT = ''
    AS_ADMIN = 1
    USER = 2
    