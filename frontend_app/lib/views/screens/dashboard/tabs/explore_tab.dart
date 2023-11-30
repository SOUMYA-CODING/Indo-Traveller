import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/explore/explore_controller.dart';
import 'package:frontend_app/views/widgets/common/custom_search_container.dart';
import 'package:frontend_app/views/widgets/common/custom_tab_header.dart';
import 'package:frontend_app/views/widgets/explore/explore_property_section.dart';
import 'package:get/get.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final exploreController = Get.put(ExploreController());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTabHeader(title: "Explore"),
            const SizedBox(height: AppSizes.spaceBtwItems),
            CustomSearchContainer(
              text: 'Where to',
              showBorder: false,
              onTap: () => exploreController.openBottomSheet(),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ExplorePropertySection(),
          ],
        ),
      ),
    );
  }
}
