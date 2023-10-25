import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/property/property_amenities_section.dart';
import 'package:frontend_app/views/widgets/property/property_app_bar.dart';
import 'package:frontend_app/views/widgets/property/property_description_section.dart';
import 'package:frontend_app/views/widgets/property/property_host_section.dart';
import 'package:frontend_app/views/widgets/property/property_image_section.dart';
import 'package:frontend_app/views/widgets/property/property_reservation_section.dart';
import 'package:frontend_app/views/widgets/property/property_review_section.dart';
import 'package:frontend_app/views/widgets/property/property_title_section.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: PropertyReservationSection(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PropertyAppBar(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyImageSection(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyTitleSection(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyHostSection(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyDescriptionSection(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyAmenitiesSection(),
            SizedBox(height: AppSizes.spaceBtwItems),
            PropertyReviewSection(),
          ],
        ),
      ),
    );
  }
}


