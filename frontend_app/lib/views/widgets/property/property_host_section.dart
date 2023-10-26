import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyHostSection extends StatelessWidget {
  final String firstName;
  final String profileImage;

  const PropertyHostSection({
    super.key,
    required this.firstName,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Hosted by $firstName",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              CircleAvatar(
                radius: AppSizes.iconMd,
                backgroundImage: NetworkImage(profileImage),
              ),
            ],
          ),
          Text(
            "2 guest . 1 bedroom . 2 beds",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(color: AppColor.grey, thickness: 1),
        ],
      ),
    );
  }
}
