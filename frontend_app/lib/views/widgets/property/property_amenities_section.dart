import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyAmenitiesSection extends StatelessWidget {
  const PropertyAmenitiesSection({super.key});

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

          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColor.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Show all 20 amenities",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(color: AppColor.grey, thickness: 1),
        ],
      ),
    );
  }
}
