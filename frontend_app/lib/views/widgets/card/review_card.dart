import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class ReviewCard extends StatelessWidget {
  final double userRating;
  final String days;
  final String message;
  final String hostImage;
  final String hostName;
  final String hostLocation;

  const ReviewCard({
    super.key,
    required this.userRating,
    required this.days,
    required this.message,
    required this.hostImage,
    required this.hostName,
    required this.hostLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(AppSizes.lg),
      margin: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        border: Border.all(color: AppColor.darkerGrey, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                days,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Text(
            message,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                radius: AppSizes.iconMd,
                backgroundImage: NetworkImage(hostImage),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hostName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    hostLocation,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}