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


class PropertyTypesSerializer(serializers.ModelSerializer):
    icon = serializers.SerializerMethodField()
    class Meta:
        model = PropertyType
        fields = [
            'id',
            'name',
            'icon',
            'is_active',
        ]
    
    def get_icon(self, obj):
        if obj.icon:
            return obj.icon.url
        return None

    

class AmenitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Amenity
        fields = [
            'id',
            'name',
            'is_active',
        ]


class PropertyImagesSerializer(serializers.ModelSerializer):
    property_images = serializers.SerializerMethodField()

    class Meta:
        model = PropertyImage
        fields = ('property_images',)

    def get_property_images(self, obj):
        if obj.property_images:
            return obj.property_images.url
        return None


class PropertyListSerializer(serializers.ModelSerializer):
    property_images = PropertyImagesSerializer(many=True)

    class Meta:
        model = Property
        fields = [
            'id',
            'property_type',
            'property_images',
            'city',
            'state',
            'price_per_night',
        ]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if 'property_images' in data and data['property_images']:
            data['property_images'] = data['property_images'][0]
        return data


class PropertyDetailsSerializer(serializers.ModelSerializer):
    property_images = PropertyImagesSerializer(many=True)
    amenities = AmenitiesSerializer(many=True)
    host = UserProfileSerializer()
    property_type = PropertyTypesSerializer()

    class Meta:
        model = Property
        fields = '__all__'


class PropertyFilterSerializer(serializers.Serializer):
    property_type_id = serializers.IntegerField()
    

class ReviewSerializer(serializers.ModelSerializer):
    user = UserProfileSerializer()

    class Meta:
        model = Review
        fields = '__all__'

class BookingSerializer(serializers.ModelSerializer):
    property = PropertyDetailsSerializer()
    guest = UserProfileSerializer()

    class Meta:
        model = Booking
        fields = '__all__'

class PaymentSerializer(serializers.ModelSerializer):
    user = UserProfileSerializer()
    property = PropertyDetailsSerializer()

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
                raise serializers.ValidationError(
                    {'error': 'Unable to blacklist token.'})

            return attrs
        else:
            raise serializers.ValidationError(
                {'refresh_token': 'This field is required.'})









