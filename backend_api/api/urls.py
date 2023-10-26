from django.urls import path, include
from . import views
from rest_framework_simplejwt.views import TokenRefreshView

# Auth
auth_patterns =[
    path('login/', views.user_login, name='auth-login'),
    path('registration/', views.user_registration, name='auth-registration'),
    path('logout/', views.user_logout, name='auth-logout'),
    path('reset-password-link/', views.send_password_reset_email,
        name='auth-reset-password-link'),
    path('update-user-password/<uid>/<token>/',
        views.user_password_update, name='user-password-update'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]


# User
user_patterns = [
    path('', views.user_list, name='user-list'),
    path('<int:user_id>/', views.user_details, name='user-details'),
    path('create/', views.create_user, name='create-user'),
    path('update/<int:user_id>/', views.update_user, name='update-user'),
    path('delete/<int:user_id>/', views.delete_user, name='delete-user'),
]

# Property Type
property_type_patterns = [
    path('', views.property_type_list, name='property-type-list'),
    path('<int:property_type_id>/', views.property_type_details, name='property-type-details'),
    path('create/', views.create_property_type, name='create-property-type'),
    path('update/<int:property_type_id>/', views.update_property_type, name='update-property-type'),
    path('delete/<int:property_type_id>/', views.delete_property_type, name='delete-property-type'),
]

# Amenity
amenity_patterns = [
    path('', views.amenity_list, name='amenity-list'),
    path('<int:amenity_id>/', views.amenity_details, name='amenity-details'),
    path('create/', views.create_amenity, name='create-amenity'),
    path('update/<int:amenity_id>/', views.update_amenity, name='update-amenity'),
    path('delete/<int:amenity_id>/', views.delete_Amenity, name='delete-amenity'),
]

# Property
property_patterns = [
    path('', views.property_list, name='property-list'),
    path('<int:property_id>/', views.property_details, name='property-details'),
    path('create/', views.create_property, name='create-property'),
    path('update/<int:property_id>/', views.update_property, name='update-property'),
    path('delete/<int:property_id>/', views.delete_property, name='delete-property'),
    path('search/', views.search_property, name='search-property'),
]

# Booking
booking_patterns = [
    path('', views.booking_list, name='booking-list'),
    path('<int:booking_id>/', views.booking_details, name='booking-details'),
    path('create/', views.create_booking, name='create-booking'),
    path('update/<int:booking_id>/', views.update_booking, name='update-booking'),
    path('delete/<int:booking_id>/', views.delete_booking, name='delete-booking'),
]

# Review
review_patterns = [
    path('create/<int:property_id>/', views.create_review, name='create-review'),
    path('list/<int:property_id>/', views.review_list, name='review-list'),
    path('update/<int:review_id>/<int:property_id>/', views.update_Review, name='update-review'),
    path('delete/<int:review_id>/<int:property_id>/', views.delete_Review, name='delete-review'),
]

# Payment
payment_patterns = [
    path('create/', views.create_Payment, name='create-payment'),
    path('list/', views.Payment_list, name='payment-list'),
    path('details/<int:payment_id>/', views.Payment_details, name='payment-details'),
    path('update/<int:payment_id>/', views.update_Payment, name='update-payment'),
    path('delete/<int:payment_id>/', views.delete_Payment, name='delete-payment'),
]

urlpatterns = [
    path('auth/', include(auth_patterns)),
    path('users/', include(user_patterns)),
    path('property_type/', include(property_type_patterns)),
    path('amenity/', include(amenity_patterns)),
    path('property/', include(property_patterns)),
    path('booking/', include(booking_patterns)),
    path('review/', include(review_patterns)),
    path('payment/', include(payment_patterns)),
]
