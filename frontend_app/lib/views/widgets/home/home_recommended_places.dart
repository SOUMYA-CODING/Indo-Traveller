import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';

class HomeRecommendedPlaces extends StatelessWidget {
  const HomeRecommendedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          const CustomSectionHeading(
            title: "Recommended Places",
            showActionButton: true,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),

        ],
      ),
    );
  }
}
