from django.contrib.auth import authenticate, login, logout
from django.db import IntegrityError
from django.db.models import Q
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated
from django.utils.encoding import smart_str, force_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from . utils import Util
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from random import randint

from core.models import UserProfile, PropertyType, Amenity, Property, Booking, Review, Payment
from . serializer import (
    UserProfileSerializer, PropertyTypesSerializer, AmenitiesSerializer, PropertyListSerializer,
    PropertyDetailsSerializer, ReviewSerializer, BookingSerializer, PaymentSerializer, UserLoginSerializer,
    UserRegistrationSerializer, SendPasswordResetEmailSerializer, UpdatePasswordSerializer, UserLogoutSerializer,
)


# ----------------------------------------- Authentication -----------------------------------------

# User Login
@swagger_auto_schema(method='POST', request_body=UserLoginSerializer)
@api_view(['POST'])
def user_login(request):
    serializer = UserLoginSerializer(data=request.data)

    if serializer.is_valid():
        username = serializer.validated_data['username']
        password = serializer.validated_data['password']

        try:
            user = UserProfile.objects.get(username=username)
        except UserProfile.DoesNotExist:
            return Response({'message': 'User does not exist.'}, status=status.HTTP_404_NOT_FOUND)

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            refresh = RefreshToken.for_user(user)
            access_token = str(refresh.access_token)
            refresh_token = str(refresh)

            token = {
                'access_token': access_token,
                'refresh_token': refresh_token,
            }

            user_serializer = UserProfileSerializer(user)
            return Response({'message': 'Login successfully.', 'tokens': token, 'data': user_serializer.data, }, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'Invalid username or password.'}, status=status.HTTP_401_UNAUTHORIZED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# User Registration
@swagger_auto_schema(method='POST', request_body=UserRegistrationSerializer)
@api_view(['POST'])
def user_registration(request):
    serializer = UserRegistrationSerializer(data=request.data)

    if serializer.is_valid():
        email = serializer.validated_data.get('email')
        username = serializer.validated_data.get('username')

        if UserProfile.objects.filter(Q(email=email) | Q(username=username)).exists():
            return Response({'message': 'User with this email or username already exists.'}, status=status.HTTP_400_BAD_REQUEST)

        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        access_token = str(refresh.access_token)
        refresh_token = str(refresh)

        token = {
            'access_token': access_token,
            'refresh_token': refresh_token,
        }

        user_serializer = UserProfileSerializer(user)

        return Response({'message': 'Registration successfully.', 'tokens': token, 'data': user_serializer.data, }, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# User Logout
@swagger_auto_schema(method='POST', request_body=UserLogoutSerializer)
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def user_logout(request):
    logout(request)
    return Response({'message': 'Logged out successfully.'}, status=status.HTTP_200_OK)


# Send Password Reset Link
@swagger_auto_schema(method='POST', request_body=SendPasswordResetEmailSerializer)
@api_view(['POST'])
def send_password_reset_email(request):
    serializer = SendPasswordResetEmailSerializer(data=request.data)
    if serializer.is_valid():
        email = serializer.validated_data.get('email')

        if UserProfile.objects.filter(email=email).exists():
            user = UserProfile.objects.get(email=email)
            uid = urlsafe_base64_encode(force_bytes(user.id))
            token = PasswordResetTokenGenerator().make_token(user)
            link = 'https://news-backend-api.onrender.com/api/auth/update-user-password/'+uid+'/'+token

            body = "Click on the link : "+link
            data = {
                "subject": "Reset your password",
                "body": body,
                "to_email": user.email,
            }

            Util.send_email(data)

            return Response({'message': 'Password reset link sent. Please check your email'}, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'Your are not a user'}, status=status.HTTP_404_NOT_FOUND)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# User Password Update
@swagger_auto_schema(method='POST', request_body=UpdatePasswordSerializer)
@api_view(['POST'])
def user_password_update(request, uid, token):
    try:
        user_id = urlsafe_base64_decode(uid).decode()
        user = UserProfile.objects.get(id=user_id)

        if not PasswordResetTokenGenerator().check_token(user, token):
            return Response({'message': 'Invalid or expired token.'}, status=status.HTTP_401_UNAUTHORIZED)

        serializer = UpdatePasswordSerializer(data=request.data)
        if serializer.is_valid():
            password = serializer.validated_data.get('password')
            user.set_password(password)
            user.save()
            return Response({'message': 'Password updated successfully.'}, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    except DjangoUnicodeDecodeError:
        return Response({'message': 'Invalid UID.'}, status=status.HTTP_400_BAD_REQUEST)
    except UserProfile.DoesNotExist:
        return Response({'message': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)
    except Exception as e:
        return Response({'message': 'An error occurred while updating the password.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


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
@swagger_auto_schema(method='POST', request_body=PropertyTypesSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_property_type(request):
    serializer = PropertyTypesSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Property type created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Property Type List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_type_list(request):
    property_type = PropertyType.objects.all()
    serializer = PropertyTypesSerializer(
        property_type, many=True, context={'request': request})
    return Response({'message': 'Property type list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Property Type Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_type_details(request, property_type_id):
    property_type = get_property_type_or_404(property_type_id)
    if property_type is None:
        return Response({'message': 'Property type not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyTypesSerializer(
        property_type, context={'request': request})
    return Response({'message': 'Property type details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Category
@swagger_auto_schema(method='PUT', request_body=PropertyTypesSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_property_type(request, property_type_id):
    property_type = get_property_type_or_404(property_type_id)
    if property_type is None:
        return Response({'message': 'Property type not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyTypesSerializer(property_type, data=request.data)
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
@swagger_auto_schema(method='POST', request_body=AmenitiesSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_amenity(request):
    serializer = AmenitiesSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Amenity created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Amenity List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def amenity_list(request):
    amenity = Amenity.objects.all()
    serializer = AmenitiesSerializer(
        amenity, many=True, context={'request': request})
    return Response({'message': 'Amenity list retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Amenity Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def amenity_details(request, amenity_id):
    amenity = get_amenity_or_404(amenity_id)
    if amenity is None:
        return Response({'message': 'Amenity not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = AmenitiesSerializer(amenity, context={'request': request})
    return Response({'message': 'Amenity details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Amenity
@swagger_auto_schema(method='PUT', request_body=AmenitiesSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_amenity(request, amenity_id):
    amenity = get_amenity_or_404(amenity_id)
    if amenity is None:
        return Response({'message': 'Amenity not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = AmenitiesSerializer(amenity, data=request.data)
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


# Create property
@swagger_auto_schema(method='POST', request_body=PropertyDetailsSerializer)
@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def create_property(request):
    serializer = PropertyDetailsSerializer(data=request.data)
    if serializer.is_valid:
        serializer.save()
        return Response({'message': 'Property created successfully', 'data': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Property List
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_list(request):
    property = Property.objects.all()
    serializer = PropertyListSerializer(
        property, many=True, context={'request': request})
    return Response({'message': 'Property list retrieved successfully', 'data': serializer.data})


# Property Details
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def property_details(request, property_id):
    property = get_property_or_404(property_id)
    if property is None:
        return Response({'message': 'Property not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyDetailsSerializer(
        property, context={'request': request})
    return Response({'message': 'Property details retrieved successfully', 'data': serializer.data}, status=status.HTTP_200_OK)


# Update Property
@swagger_auto_schema(method='PUT', request_body=PropertyDetailsSerializer)
@api_view(['PUT'])
# @permission_classes([IsAuthenticated])
def update_property(request, property_id):
    property = get_property_or_404(property_id)
    if property is None:
        return Response({'message': 'Property not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = PropertyDetailsSerializer(property, data=request.data)
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

    serializer = PropertyDetailsSerializer(
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
