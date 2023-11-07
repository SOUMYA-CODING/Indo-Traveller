from django.db import models
from django.contrib.auth.models import AbstractUser
from cloudinary.models import CloudinaryField
from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile


USER_TYPE = [
    ('guest', 'Guest'),
    ('host', 'Host'),
    ('admin', 'Admin'),
]

STATUS_CHOICES = (
    ('pending', 'Pending'),
    ('confirmed', 'Confirmed'),
    ('canceled', 'Canceled'),
    ('completed', 'Completed'),
)


class UserProfile(AbstractUser):
    user_type = models.CharField(
        max_length=10, choices=USER_TYPE, default='guest')

    profile_picture = CloudinaryField(
        'profile_pictures/', blank=True, null=True, transformation={
            'fetch_format': 'webp',
        })
    phone_number = models.CharField(max_length=10, null=True, blank=True)

    address = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.username


class PropertyType(models.Model):
    name = models.CharField(max_length=150)
    icon = CloudinaryField(
        'property_icons/', blank=True, null=True, transformation={
            'fetch_format': 'webp',
        })

    is_active = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Amenity(models.Model):
    name = models.CharField(max_length=50)

    is_active = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Property(models.Model):
    host = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    property_type = models.ForeignKey(
        PropertyType, on_delete=models.CASCADE, null=True)

    title = models.CharField(max_length=255)
    description = models.TextField()
    price_per_night = models.DecimalField(max_digits=10, decimal_places=2)

    state = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    address = models.TextField()

    number_of_guest_allowed = models.PositiveIntegerField(null=True)

    number_of_bedrooms = models.PositiveIntegerField(null=True)

    number_of_queen_beds = models.PositiveIntegerField(null=True)
    number_of_king_beds = models.PositiveIntegerField(null=True)
    number_of_double_beds = models.PositiveIntegerField(null=True)
    number_of_single_beds = models.PositiveIntegerField(null=True)

    amenities = models.ManyToManyField(Amenity)

    is_active = models.BooleanField(default=True)

    is_reserved = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class PropertyImage(models.Model):
    property = models.ForeignKey('Property', on_delete=models.CASCADE, related_name='property_images')
    property_images = CloudinaryField(
        'property_images/', blank=True, null=True, transformation={
            'fetch_format': 'webp',
        })

    
class Booking(models.Model):
    property = models.ForeignKey(Property, on_delete=models.CASCADE)
    guest = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    number_of_adults = models.PositiveIntegerField()
    number_of_childrens = models.PositiveIntegerField()
    check_in = models.DateField()
    check_out = models.DateField()
    total_price = models.DecimalField(max_digits=10, decimal_places=2)

    special_request = models.TextField()

    status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default='pending')

    check_in_date_time = models.DateTimeField(null=True, blank=True)
    check_out_date_time = models.DateTimeField(null=True, blank=True)

    canceled = models.BooleanField(default=False)
    canceled_date = models.DateTimeField(null=True, blank=True)
    canceled_by = models.ForeignKey(
        UserProfile, on_delete=models.SET_NULL, null=True, related_name='canceled_bookings')

    refunded = models.BooleanField(default=False)
    refund_date = models.DateTimeField(null=True, blank=True)
    refund_amount = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Booking for {self.property.title} by {self.guest.username}"


class Review(models.Model):
    property = models.ForeignKey(Property, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    comment = models.TextField()

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Review by {self.user.username} for {self.property.title}"


class Payment(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    property = models.ForeignKey(Property, on_delete=models.CASCADE)

    amount = models.DecimalField(max_digits=10, decimal_places=2)

    status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default='pending')

    payment_date = models.DateTimeField(auto_now_add=True)
    payment_type = models.CharField(max_length=100)

    def __str__(self):
        return f"Payment by {self.user.username} for {self.property.title}"
