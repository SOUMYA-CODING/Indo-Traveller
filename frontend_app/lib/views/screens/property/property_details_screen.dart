import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/property/property_details_controller.dart';
import 'package:frontend_app/controllers/user_profile/user_profile_controller.dart';
import 'package:frontend_app/views/widgets/property/property_amenities_section.dart';
import 'package:frontend_app/views/widgets/property/property_app_bar.dart';
import 'package:frontend_app/views/widgets/property/property_description_section.dart';
import 'package:frontend_app/views/widgets/property/property_host_section.dart';
import 'package:frontend_app/views/widgets/property/property_image_section.dart';
import 'package:frontend_app/views/widgets/property/property_reservation_section.dart';
import 'package:frontend_app/views/widgets/property/property_review_section.dart';
import 'package:frontend_app/views/widgets/property/property_title_section.dart';
import 'package:get/get.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyDetailsController = Get.put(PropertyDetailsController());
    final userProfileController = Get.put(UserProfileController());

    return Obx(() {
      final propertyDetails = propertyDetailsController.propertyDetails.value;
      final userProfileDetails = userProfileController.userProfileDetails.value;

      return Scaffold(
        bottomNavigationBar: PropertyReservationSection(
          pricePerNight: propertyDetails.pricePerNight,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PropertyAppBar(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const PropertyImageSection(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              PropertyTitleSection(
                title: propertyDetails.title,
                location: "${propertyDetails.city}, ${propertyDetails.state}",
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              PropertyHostSection(
                firstName: userProfileDetails.firstName,
                profileImage: userProfileDetails.profilePicture,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              PropertyDescriptionSection(
                description: propertyDetails.description,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              PropertyAmenitiesSection(
                amenitiesList: propertyDetails.amenities,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const PropertyReviewSection(),
            ],
          ),
        ),
      );
    });
  }
}
