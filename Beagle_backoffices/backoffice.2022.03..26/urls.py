from django.urls import path,include
from . import views
from django.contrib.auth import views as auth

app_name = 'backoffice'
urlpatterns = [
    path('query',views.query),
    
    # --------------------- user urls ----------------#
    
    # index page of user
    path('',views.index,name="index"),
    
    # do not change the url, given first paramiter of the path, used in user-index page page with the auth_tag. 
    path('user-customer',views.user_customer,name="user_customer"),
    path('user-company',views.user_company,name="user_company"),
    path('user-distributor',views.user_distributor,name="user_distributor"),
    path('user-dealer',views.user_dealer,name="user_dealer"),
    path('user-service-agent',views.user_service_agent,name="user_service_agent"),
    path('user-lender',views.user_lender,name="user_lender"),
    
    
    # notes :- portal users private approvals
    path('user/<str:account_string>/pending/',views.user_pending_profile,name="user_pending_profile"), #approve pending list user wise
    path('inquiry-list/',views.inquiry_list,name="inquiry_list"), # all inquiry list
    path('forward_inquiry-list/',views.forward_inq,name="forward_inq"), # all inquiry list
    # path('check-scheme-exists/', views.check_scheme_exists, name='check_scheme_exists'),
    
    # notes :- categories and sub-categories urls start from here.
    path('category-create/',views.category_create,name="category_create"),
    path('category-edit/<slug:slug>',views.category_edit,name="category_edit"),
    path('category-list/',views.category_list,name="category_list"),
    path('category-delete/<slug:slug>',views.category_delete,name="category_delete"),
    
    
    path('subcategory-create/',views.subcategory_create,name="subcategory_create"),
    path('subcategory-edit/<slug:slug>',views.subcategory_edit,name="subcategory_edit"),
    path('subcategory-list/',views.subcategory_list,name="subcategory_list"),
    path('subcategory-delete/<slug:slug>',views.subcategory_delete,name="subcategory_delete"),

    
    # notes :- products urls start from here
    # this is ajax for the page - product_list filters
    path('ajax-category/',views.ajax_category,name="ajax_category"), # all category ajax list
    path('ajax-sub-category/',views.ajax_subcategory,name="ajax_subcategory"), # all sub-category ajax list
    path('ajax-compay/',views.ajax_company,name="ajax_company"), # all sub-category ajax list
    path('product-list/',views.product_list,name="product_list"), # all product list
    
    # do not change the first parameter because the ajax work on the static > js > product-page.js
    path('product-create/', views.create_product, name='create_product'),
    path('product-edit/<int:pk>/',views.edit_product,name="edit_product"), # all product edit page
    path('delete-image-by-id/', views.delete_image_by_id, name='delete_image_by_id'),# product create / update
    path('get-product-delivery-form/', views.get_product_delivery_form,name='product_delivery_form'),# product create / update
    path('get-price-structure/', views.get_price_form, name='get_price_form'),# product create / update
    path('make-featured-img/<int:pk>/', views.make_image_as_feature_img,name='make_image_as_feature_img'),# product create / update
    path('get-product-delivery-details/', views.get_delivery_detail_by_product_id,name='product_delivery_details'),# product create / update
    path('ajax_calls/get-sub-categories/', views.get_sub_categories_by_cat_id, name='ge_sub_cat'),# product create / update
    path('ajax_calls/get-sub-categories-products/', views.get_product_by_sub_cat, name='get_product_by_sub_cat'),# product create / update
    path('ajax_calls/get-company-as-vendor/',views.get_company_as_vendor,name="get_company_as_vendor"),
    
    
    # ------------------- comman urls ----------------#
    path('signup/',views.signup,name="signup"),
    path('signin/',views.signin,name="signin"),
    path('logout/',views.logout_view,name="logout_view"),
    path('all-users/',views.all_users,name="all_users"),# not in use
    
    
    # --------------------- admin urls ----------------#
    
    # index page of admin
    path('admin/dashboard/',views.admin_index,name="admin_index"),
    
    # notes :- backoffice users view,edit,edit_role,active
    path('admin/dashboard/backoffice-users/',views.backoffice_users,name="backoffice_users"),
    path('admin/dashboard/backoffice-users/<int:pk>/',views.view_profile,name="view_profile"),
    path('admin/dashboard/backoffice-users/edit/<int:pk>/',views.edit_profile,name="edit_profile"),
    path('admin/dashboard/profiles/',views.admin_profiles,name="admin_profiles"),
    
    
    # notes :- all the approvals profiles are been display here like bizcred profiles
    path('admin/dashboard/profiles/<int:uid>/', views.admin_view, name='view-profile'),
    # this path is given static in templates/'backoffice/admin/view-profiles.html'
    path('admin/dashboard/reject/<int:uid>/<int:step>', views.admin_reject, name='reject_profile'),
    
    
]