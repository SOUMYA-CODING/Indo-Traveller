import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyAmenitiesSection extends StatelessWidget {
  final List amenitiesList;

  const PropertyAmenitiesSection({super.key, required this.amenitiesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What this place offers",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: amenitiesList.map((amenity) {
              return Row(
                children: [
                  Container(
                    width: AppSizes.sm,
                    height: AppSizes.sm,
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Text(amenity.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(color: AppColor.grey, thickness: 1),
        ],
      ),
    );
  }
}
