import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyTitleSection extends StatelessWidget {
  const PropertyTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lake View Premium Room in Alleppey",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Kainakary South, Kerala, India",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(color: AppColor.grey, thickness: 1),
        ],
      ),
    );
  }
}
