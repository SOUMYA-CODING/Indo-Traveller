from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken

from core.models import UserProfile, PropertyType, Amenity, Property, PropertyImage, Booking, Review, Payment


class UserProfileSerializer(serializers.ModelSerializer):
    profile_picture = serializers.SerializerMethodField()

    class Meta:
        model = UserProfile
        fields = [
            'id',
            'profile_picture',
            'password',
            'username',
            'first_name',
            'last_name',
            'email',
            'is_active',
            'is_superuser',
            'user_type',
            'phone_number',
            'address',
        ]

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
        fields = [
            'id',
            'name',
            'is_active',
        ]


class PropertyImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PropertyImage
        fields = ('property_images',)


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


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)


class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = UserProfile
        fields = [
            'id',
            'first_name',
            'last_name',
            'email',
            'phone_number',
            'username',
            'password',
            'user_type',
        ]

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = UserProfile(**validated_data)
        user.set_password(password)
        user.save()
        return user
    

class SendPasswordResetEmailSerializer(serializers.Serializer):
    email = serializers.EmailField(max_length=255)
    class Meta:
        fields = ['email']


class UpdatePasswordSerializer(serializers.Serializer):
    password = serializers.CharField(required=True)
    password2 = serializers.CharField(required=True)

    def validate(self, data):
        password = data.get('password')
        password2 = data.get('password2')

        # Check if both passwords match
        if password != password2:
            raise serializers.ValidationError("Passwords do not match")

        return data


class UserLogoutSerializer(serializers.Serializer):
    refresh_token = serializers.CharField(write_only=True)

    def validate(self, attrs):
        refresh_token = attrs.get('refresh_token')

        if refresh_token:
            try:
                RefreshToken(refresh_token).blacklist()
            except Exception as e:
                raise serializers.ValidationError({'error': 'Unable to blacklist token.'})

            return attrs
        else:
            raise serializers.ValidationError({'refresh_token': 'This field is required.'})