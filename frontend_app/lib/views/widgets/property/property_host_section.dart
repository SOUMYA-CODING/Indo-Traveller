import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';

class PropertyHostSection extends StatelessWidget {
  final String firstName;
  final String profileImage;
  final int numberOfGuestAllowed;
  final int numberOfBedroom;
  final int numberOfBeds;

  const PropertyHostSection({
    super.key,
    required this.firstName,
    required this.profileImage,
    required this.numberOfGuestAllowed,
    required this.numberOfBedroom,
    required this.numberOfBeds,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
            "$numberOfGuestAllowed guest . $numberOfBedroom bedroom . $numberOfBeds beds",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(color: AppColor.grey, thickness: 1),
        ],
      ),
    );
  }
}
