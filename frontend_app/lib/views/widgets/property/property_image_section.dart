import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/property/property_details_controller.dart';
import 'package:frontend_app/data/model/property_details_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class PropertyImageSection extends StatelessWidget {
  final List<PropertyImage> imagesList;

  const PropertyImageSection({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    final propertyDetailsController = Get.put(PropertyDetailsController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      reverse: false,
                      onPageChanged: (index, reason) =>
                          propertyDetailsController.setActiveImageIndex(index)),
                  items: imagesList.map((image) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardRadiusLg),
                      child: Image.network(
                        image.propertyImages,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                bottom: AppSizes.md,
                right: AppSizes.md,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.md, vertical: AppSizes.sm),
                  decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(AppSizes.sm)),
                  child: Obx(
                    () => Text(
                      "${propertyDetailsController.activeImageIndex.value + 1} / ${imagesList.length}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
