import random
class AuthRouter:
    """
    A router to control all database operations on models in the
    auth and contenttypes applications.
    """
    route_app_labels = {'auth', 'contenttypes','admin','sessions','social_django'}

    def db_for_read(self, model, **hints):
        """
        Attempts to read auth and contenttypes models go to auth_db.
        """
        if model._meta.app_label in self.route_app_labels:
            return 'auth_db'
        return None

    def db_for_write(self, model, **hints):
        """
        Attempts to write auth and contenttypes models go to auth_db.
        """
        if model._meta.app_label in self.route_app_labels:
            return 'auth_db'
        return None

    def allow_relation(self, obj1, obj2, **hints):
        """
        Allow relations if a model in the auth or contenttypes apps is
        involved.
        """
        if (
            obj1._meta.app_label in self.route_app_labels or
            obj2._meta.app_label in self.route_app_labels
        ):
           return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        """
        Make sure the auth and contenttypes apps only appear in the
        'auth_db' database.
        """
        if app_label in self.route_app_labels:
            return db == 'auth_db'
        return None
   
    
class BizcredConfig:
    route_app_labels = {'bizcred','backoffice','veloce','veloces'}

    def db_for_read(self, model, **hints):
        # print('enter read and label is -> ',model._meta.app_label)
        
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'bizcred':
            return 'bizcred_db'
        
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'veloce':
            return 'veloce1_db'
        
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'veloces':
            return 'veloce2_db'

        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'backoffice':
            # print('enter backoffice and label is -> ',model._meta.app_label)
            return 'auth_db'
        # print('execute else of all')
        # print('route_app_labelsroute_app_labelsroute_app_labels',self.route_app_labels)
        return random.choice(['auth_db','bizcred_db','veloce1_db','veloce2_db'])

    def db_for_write(self, model, **hints):
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'bizcred':
                return 'bizcred_db'
        
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'veloce':
            return 'veloce1_db'
        
        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'veloces':
            return 'veloce2_db'

        if model._meta.app_label in self.route_app_labels and model._meta.app_label == 'backoffice':
            # print('enter backoffice and label is -> ',model._meta.app_label)
            return 'auth_db'
        # if model._meta.app_label in self.route_app_labels:
        #     return 'backoffice_bizcred_db'
        return 'auth_db'

    def allow_relation(self, obj1, obj2, **hints):
        """
        Allow relations if a model in the auth or contenttypes apps is
        involved.
        """
        # db_set = {'auth_db', 'bizcred_db',}
        # if obj1._state.db in db_set and obj2._state.db in db_set:
        #     return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        """
        Make sure the auth and contenttypes apps only appear in the
        'auth_db' database.
        """
        return True



# class BizcredConfig:
#     """
#     A router to control all database operations on models in the
#     auth and contenttypes applications.
#     """
#     route_app_labels = {'Bizcred'}

#     def db_for_read(self, model, **hints):
#         """
#         Attempts to read auth and contenttypes models go to auth_db.
#         """
#         if model._meta.app_label in self.route_app_labels:
#             return 'bizcred_db'
#         return None

#     def db_for_write(self, model, **hints):
#         """
#         Attempts to write auth and contenttypes models go to auth_db.
#         """
#         if model._meta.app_label in self.route_app_labels:
#             return 'bizcred_db'
#         return None

#     def allow_relation(self, obj1, obj2, **hints):
#         """
#         Allow relations if a model in the auth or contenttypes apps is
#         involved.
#         """
#         if (
#             obj1._meta.app_label in self.route_app_labels or
#             obj2._meta.app_label in self.route_app_labels
#         ):
#            return True
#         return None

#     def allow_migrate(self, db, app_label, model_name=None, **hints):
#         """
#         Make sure the auth and contenttypes apps only appear in the
#         'auth_db' database.
#         """
#         if app_label in self.route_app_labels:
#             return db == 'bizcred_db'
#         return None
    
# class MarketRouter:
#     """
#     A router to control all database operations on models in the
#     auth and contenttypes applications.
#     """
#     route_app_labels = {'Market',}

#     def db_for_read(self, model, **hints):
#         """
#         Attempts to read auth and contenttypes models go to auth_db.
#         """
#         if model._meta.app_label in self.route_app_labels:
#             return 'market_db'
#         return None

#     def db_for_write(self, model, **hints):
#         """
#         Attempts to write auth and contenttypes models go to auth_db.
#         """
#         if model._meta.app_label in self.route_app_labels:
#             return 'market_db'
#         return None

#     def allow_relation(self, obj1, obj2, **hints):
#         """
#         Allow relations if a model in the auth or contenttypes apps is
#         involved.
#         """
#         if (
#             obj1._meta.app_label in self.route_app_labels or
#             obj2._meta.app_label in self.route_app_labels
#         ):
#            return True
#         return None

#     def allow_migrate(self, db, app_label, model_name=None, **hints):
#         """
#         Make sure the auth and contenttypes apps only appear in the
#         'auth_db' database.
#         """
#         if app_label in self.route_app_labels:
#             return db == 'market_db'
#         return None