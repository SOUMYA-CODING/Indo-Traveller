from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken

from core.models import UserProfile, PropertyType, Amenity, Property, PropertyImage, Booking, Review, Payment


class UserProfileSerializer(serializers.ModelSerializer):
    profile_picture = serializers.SerializerMethodField()

    class Meta:
        model = UserProfile
        fields = '__all__'

    def get_profile_picture(self, obj):
        if obj.profile_picture:
            return obj.profile_picture.url
        return None


class PropertyTypeSerializer(serializers.ModelSerializer):
    icon = serializers.SerializerMethodField()

    class Meta:
        model = PropertyType
        fields = '__all__'
    
    def get_icon(self, obj):
        if obj.icon:
            return obj.icon.url
        return None


class AmenitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Amenity
        fields = '__all__'


class PropertyImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PropertyImage
        fields = '__all__'


class PropertySerializer(serializers.ModelSerializer):
    property_images = PropertyImageSerializer(many=True, read_only=True)
    amenities = AmenitySerializer(many=True, read_only=True)

    class Meta:
        model = Property
        fields = '__all__'
    
    def get_property_images(self, obj):
        if obj.property_images:
            return obj.property_images.url
        return None


class BookingSerializer(serializers.ModelSerializer):
    property = PropertySerializer()
    guest = UserProfileSerializer()

    class Meta:
        model = Booking
        fields = '__all__'


class ReviewSerializer(serializers.ModelSerializer):
    property = PropertySerializer()
    user = UserProfileSerializer()

    class Meta:
        model = Review
        fields = '__all__'


class PaymentSerializer(serializers.ModelSerializer):
    user = UserProfileSerializer()
    property = PropertySerializer()

    class Meta:
        model = Payment
        fields = '__all__'
