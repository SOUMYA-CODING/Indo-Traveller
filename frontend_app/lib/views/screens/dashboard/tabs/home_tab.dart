import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/common/custom_header.dart';
import 'package:frontend_app/views/widgets/common/custom_search_container.dart';
import 'package:frontend_app/views/widgets/home/home_app_bar.dart';
import 'package:frontend_app/views/widgets/home/home_property_type.dart';
import 'package:frontend_app/views/widgets/home/home_recommended_places.dart';
import 'package:frontend_app/views/widgets/home/home_your_destination.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  CustomSearchContainer(text: 'Search Places'),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  HomePropertyType(),
                ],
              ),
            ),
            HomeRecommendedPlaces(),
            SizedBox(height: AppSizes.spaceBtwSections),
            HomeYourDestination(),
            SizedBox(height: AppSizes.md),
          ],
        ),
      ),
    );
  }
}
