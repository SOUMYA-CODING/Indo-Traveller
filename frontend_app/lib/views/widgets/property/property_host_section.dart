import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyHostSection extends StatelessWidget {
  const PropertyHostSection({super.key});

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
                  "Hosted by Akhil",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const CircleAvatar(
                radius: AppSizes.iconMd,
                backgroundImage: NetworkImage(
                    "https://a0.muscache.com/im/pictures/user/a9546fd7-c966-462b-a687-47305540ce73.jpg?im_w=240"),
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
