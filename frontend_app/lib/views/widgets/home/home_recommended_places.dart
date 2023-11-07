import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/dashboard/dashboard_controller.dart';
import 'package:frontend_app/controllers/property/property_list_controller.dart';
import 'package:frontend_app/data/model/property_list_model.dart';
import 'package:frontend_app/views/widgets/card/property_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:get/get.dart';

class HomeRecommendedPlaces extends StatelessWidget {
  const HomeRecommendedPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(PropertyListController());
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: CustomSectionHeading(
            title: "Recommended Places",
            showActionButton: true,
            onPressed: () => DashboardController.instance.onTap(1),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems - 10),
        Obx(
          () => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: GridView.builder(
              itemCount: propertyController.propertyList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSizes.gridViewSpacing,
                crossAxisSpacing: AppSizes.gridViewSpacing,
                mainAxisExtent: 200,
              ),
              itemBuilder: (_, index) {
                Datum property = propertyController.propertyList[index];
                return PropertyCard(
                  id: property.id,
                  price: property.pricePerNight,
                  location: property.city,
                  image: property.propertyImages.propertyImages,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
