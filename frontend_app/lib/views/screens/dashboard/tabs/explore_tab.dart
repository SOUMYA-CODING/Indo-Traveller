import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/property_type/property_type_controller.dart';
import 'package:frontend_app/views/widgets/common/custom_tab_header.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyTypeController = Get.put(PropertyTypeController());
    return DefaultTabController(
      length: propertyTypeController.propertyTypeList.length,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTabHeader(title: "Explore"),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultSpace),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.dark, width: 1),
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardRadiusLg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.dark, width: 1),
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardRadiusLg),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.dark, width: 1),
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardRadiusLg),
                    ),
                    hintText: "Where to",
                    suffixIcon: const Icon(Iconsax.search_normal,
                        color: AppColor.black),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicatorColor: AppColor.primary,
                      labelColor: AppColor.dark,
                      unselectedLabelColor: AppColor.darkGrey,
                      tabs: List.generate(
                        propertyTypeController.propertyTypeList.length,
                        (index) {
                          final propertyType =
                              propertyTypeController.propertyTypeList[index];
                          return Tab(
                            child: Row(
                              children: [
                                Image.network(propertyType.icon,
                                    width: AppSizes.iconLg),
                                const SizedBox(width: AppSizes.md),
                                Text(propertyType.name),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
