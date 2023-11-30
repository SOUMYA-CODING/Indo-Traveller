import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/dashboard/dashboard_controller.dart';
import 'package:frontend_app/controllers/explore/explore_controller.dart';
import 'package:frontend_app/views/widgets/common/custom_header.dart';
import 'package:frontend_app/views/widgets/common/custom_search_container.dart';
import 'package:frontend_app/views/widgets/home/home_app_bar.dart';
import 'package:frontend_app/views/widgets/home/home_property_type.dart';
import 'package:frontend_app/views/widgets/home/home_recommended_places.dart';
import 'package:frontend_app/views/widgets/home/home_your_destination.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExploreController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  CustomSearchContainer(
                    text: 'Search Places',
                    onTap: () {
                      DashboardController.instance.onTap(1);
                      ExploreController.instance.openBottomSheet();
                    },
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const HomePropertyType(),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
            const HomeRecommendedPlaces(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const HomeYourDestination(),
            const SizedBox(height: AppSizes.md),
          ],
        ),
      ),
    );
  }
}
