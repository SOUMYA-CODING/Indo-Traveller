import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/property/property_details_controller.dart';
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

    return Obx(
      () {
        final propertyDetails = propertyDetailsController.propertyDetails.value;

        return Scaffold(
          bottomNavigationBar: PropertyReservationSection(
            pricePerNight: propertyDetails!.pricePerNight,
            propertyImage: propertyDetails.propertyImages[0].propertyImages,
            propertyType: propertyDetails.propertyType.name,
            propertyTitle: propertyDetails.title,
            propertyId: propertyDetails.id,
            userId: 2,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const PropertyAppBar(),
                const SizedBox(height: AppSizes.spaceBtwItems),
                PropertyImageSection(
                  imagesList: propertyDetails.propertyImages,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                PropertyTitleSection(
                  title: propertyDetails.title,
                  location: "${propertyDetails.city}, ${propertyDetails.state}",
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                PropertyHostSection(
                  firstName: propertyDetails.host.firstName,
                  profileImage: propertyDetails.host.profilePicture,
                  numberOfGuestAllowed: propertyDetails.numberOfGuestAllowed,
                  numberOfBedroom: propertyDetails.numberOfBedrooms,
                  numberOfBeds: propertyDetails.numberOfQueenBeds +
                      propertyDetails.numberOfDoubleBeds +
                      propertyDetails.numberOfKingBeds +
                      propertyDetails.numberOfSingleBeds,
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
      },
    );
  }
}
