from django.contrib.auth import authenticate, login, logout
from django.db import IntegrityError
from django.db.models import Q
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from django.utils.encoding import smart_str, force_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from . utils import Util
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from random import randint

from core.models import UserProfile, PropertyType, Amenity, Property, PropertyImage, Booking, Review, Payment
from . serializer import (
    UserProfileSerializer, PropertyTypeSerializer, AmenitySerializer, PropertySerializer,
    PropertyImageSerializer, BookingSerializer, ReviewSerializer, PaymentSerializer
)


# ----------------------------------------- User -----------------------------------------

def get_user_or_404(user_id):
    try:
        return UserProfile.objects.get(pk=user_id)
    except UserProfile.DoesNotExist:
        return None


# Create User
@swagger_auto_schema(method='POST', request_body=UserProfileSerializer)
@api_view(['POST'])
def create_user(request):
    serializer = UserProfileSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'User created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# User List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def user_list(request):
    users = UserProfile.objects.all()
    serializer = UserProfileSerializer(
        users, many=True, context={'request': request})
    return Response({'message': 'User list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# User Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def user_details(request, user_id):
    user = get_user_or_404(user_id)
    if user is None:
        return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = UserProfileSerializer(user, context={'request': request})
    return Response({'message': 'User details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update User
@swagger_auto_schema(method='PUT', request_body=UserProfileSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_user(request, user_id):
    user = get_user_or_404(user_id)
    if user is None:
        return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = UserProfileSerializer(user, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'User updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete User
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_user(request, user_id):
    user = get_user_or_404(user_id)
    if user is None:
        return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    user.delete()
    return Response({'message': 'User deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# ----------------------------------------- Property Type -----------------------------------------

def get_property_type_or_404(property_type_id):
    try:
        return PropertyType.objects.get(pk=property_type_id)
    except PropertyType.DoesNotExist:
        return None


# Create Property Type
@swagger_auto_schema(method='POST', request_body=PropertyTypeSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_property_type(request):
    serializer = PropertyTypeSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Property type created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Property Type List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_type_list(request):
    property_type = PropertyType.objects.all()
    serializer = PropertyTypeSerializer(
        property_type, many=True, context={'request': request})
    return Response({'message': 'Property type list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Property Type Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_type_details(request, property_type_id):
    property_type = get_property_type_or_404(property_type_id)
    if property_type is None:
        return Response({'message': 'Property type not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyTypeSerializer(
        property_type, context={'request': request})
    return Response({'message': 'Property type details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Category
@swagger_auto_schema(method='PUT', request_body=PropertyTypeSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_property_type(request, property_type_id):
    property_type = get_property_type_or_404(property_type_id)
    if property_type is None:
        return Response({'message': 'Property type not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyTypeSerializer(property_type, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Property type updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Category
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_property_type(request, property_type_id):
    property_type = get_property_type_or_404(property_type_id)
    if property_type is None:
        return Response({'message': 'Property type not found'}, status=status.HTTP_404_NOT_FOUND)

    property_type.delete()
    return Response({'message': 'Property type deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# ----------------------------------------- Amenity -----------------------------------------

def get_amenity_or_404(amenity_id):
    try:
        return Amenity.objects.get(pk=amenity_id)
    except Amenity.DoesNotExist:
        return None


# Create amenity
@swagger_auto_schema(method='POST', request_body=AmenitySerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_amenity(request):
    serializer = AmenitySerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Amenity created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Amenity List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def amenity_list(request):
    amenity = Amenity.objects.all()
    serializer = AmenitySerializer(
        amenity, many=True, context={'request': request})
    return Response({'message': 'Amenity list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Amenity Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def amenity_details(request, amenity_id):
    amenity = get_amenity_or_404(amenity_id)
    if amenity is None:
        return Response({'message': 'Amenity not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = AmenitySerializer(amenity, context={'request': request})
    return Response({'message': 'Amenity details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Amenity
@swagger_auto_schema(method='PUT', request_body=AmenitySerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_amenity(request, amenity_id):
    amenity = get_amenity_or_404(amenity_id)
    if amenity is None:
        return Response({'message': 'Amenity not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = AmenitySerializer(amenity, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Amenity updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Amenity
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_Amenity(request, amenity_id):
    amenity = get_amenity_or_404(amenity_id)
    if amenity is None:
        return Response({'message': 'Amenity not found'}, status=status.HTTP_404_NOT_FOUND)

    amenity.delete()
    return Response({'message': 'Amenity deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# ----------------------------------------- Property -----------------------------------------

def get_property_or_404(property_id):
    try:
        return Property.objects.get(pk=property_id)
    except Property.DoesNotExist:
        return None


class PropertyPagination(PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    max_page_size = 100


# Create property
@swagger_auto_schema(method='POST', request_body=PropertySerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_property(request):
    serializer = PropertySerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Property created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Property List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_list(request):
    property = Property.objects.all()
    paginator = PropertyPagination()
    result_page = paginator.paginate_queryset(property, request)
    serializer = PropertySerializer(
        result_page, many=True, context={'request': request})
    return paginator.get_paginated_response({'message': 'Property list retrieved successfully', 'data': serializer.data})


# Property Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_details(request, property_id):
    property = get_property_or_404(property_id)
    if property is None:
        return Response({'message': 'Property not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertySerializer(property, context={'request': request})
    return Response({'message': 'Property details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Property
@swagger_auto_schema(method='PUT', request_body=PropertySerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_property(request, property_id):
    property = get_property_or_404(property_id)
    if property is None:
        return Response({'message': 'Property not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertySerializer(property, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Property updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Property
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_property(request, property_id):
    property = get_property_or_404(property_id)
    if property is None:
        return Response({'message': 'Property not found'}, status=status.HTTP_404_NOT_FOUND)

    property.delete()
    return Response({'message': 'Property deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# Search property
@swagger_auto_schema(
    method='GET',
    manual_parameters=[
        openapi.Parameter(
            name='query',
            in_=openapi.IN_QUERY,
            description='Search query string',
            type=openapi.TYPE_STRING,
        ),
    ],
)
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def search_property(request):
    query = request.query_params.get('query', '')

    property = Property.objects.filter(Q(title__icontains=query))

    serializer = PropertySerializer(
        property, many=True, context={'request': request})
    return Response({'message': 'Articles matching the search query retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# ----------------------------------------- Booking -----------------------------------------

def get_booking_or_404(booking_id):
    try:
        return Booking.objects.get(pk=booking_id)
    except Booking.DoesNotExist:
        return None


# Create Booking
@swagger_auto_schema(method='POST', request_body=BookingSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_booking(request):
    serializer = BookingSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Booking created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Booking List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def booking_list(request):
    booking = Booking.objects.all()
    serializer = BookingSerializer(booking, many=True)
    return Response({'message': 'Booking list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Booking Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def booking_details(request, booking_id):
    booking = get_booking_or_404(booking_id)
    if booking is None:
        return Response({'message': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = BookingSerializer(booking, context={'request': request})
    return Response({'message': 'Booking details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Booking
@swagger_auto_schema(method='PUT', request_body=BookingSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_booking(request, booking_id):
    booking = get_booking_or_404(booking_id)
    if booking is None:
        return Response({'message': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = BookingSerializer(booking, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Booking updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Booking
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_booking(request, booking_id):
    booking = get_booking_or_404(booking_id)
    if booking is None:
        return Response({'message': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)

    booking.delete()
    return Response({'message': 'Booking deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# ----------------------------------------- Review -----------------------------------------

def get_review_or_404(review_id, property_id):
    try:
        return Property.objects.get(pk=review_id, property=property_id)
    except Property.DoesNotExist:
        return None


# Create review
@swagger_auto_schema(method='POST', request_body=ReviewSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_review(request, property_id):
    serializer = ReviewSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save(property=property_id)
        return Response({'message': 'Review created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Review List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def review_list(request, property_id):
    review = Review.objects.filter(property=property_id)
    serializer = ReviewSerializer(review, many=True)
    return Response({'message': 'Review list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Review
@swagger_auto_schema(method='PUT', request_body=ReviewSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_Review(request, review_id, property_id):
    review = get_review_or_404(review_id, property_id)
    if review is None:
        return Response({'message': 'Review not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = ReviewSerializer(Review, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Review updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Review
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_Review(request, review_id, property_id):
    review = get_review_or_404(review_id, property_id)
    if review is None:
        return Response({'message': 'Review not found'}, status=status.HTTP_404_NOT_FOUND)

    review.delete()
    return Response({'message': 'Review deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


# ----------------------------------------- Payment -----------------------------------------

def get_payment_or_404(payment_id):
    try:
        return Payment.objects.get(pk=payment_id)
    except Payment.DoesNotExist:
        return None


# Create Payment
@swagger_auto_schema(method='POST', request_body=PaymentSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_Payment(request):
    serializer = PaymentSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Payment created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Payment List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def Payment_list(request):
    payment = Payment.objects.all()
    serializer = PaymentSerializer(payment, many=True)
    return Response({'message': 'Payment list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Payment Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def Payment_details(request, payment_id):
    payment = get_payment_or_404(payment_id)
    if payment is None:
        return Response({'message': 'Payment not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PaymentSerializer(payment, context={'request': request})
    return Response({'message': 'Payment details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Payment
@swagger_auto_schema(method='PUT', request_body=PaymentSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_Payment(request, payment_id):
    payment = get_payment_or_404(payment_id)
    if payment is None:
        return Response({'message': 'Payment not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PaymentSerializer(payment, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'Payment updated successfully', 'data': serializer.data}, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Delete Payment
@api_view(['DELETE'])
# @permission_classes([IsAuthenticated])
def delete_Payment(request, payment_id):
    payment = get_payment_or_404(payment_id)
    if payment is None:
        return Response({'message': 'Payment not found'}, status=status.HTTP_404_NOT_FOUND)

    payment.delete()
    return Response({'message': 'Payment deleted successfully'}, status=status.HTTP_204_NO_CONTENT)
