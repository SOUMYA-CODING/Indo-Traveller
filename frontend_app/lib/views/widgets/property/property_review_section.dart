import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/card/review_card.dart';
import 'package:iconsax/iconsax.dart';

class PropertyReviewSection extends StatelessWidget {
  const PropertyReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Iconsax.star),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                "4.86 - 106 reviews",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => const ReviewCard(
                    userRating: 4.5,
                    days: "5 days ago",
                    message:
                        "Place is nice but bed is too hard and they provide single blanket, Place is nice but bed is too hard and they provide single blanket, Place is nice but bed is too hard and they provide single blanket",
                    hostImage:
                        "https://a0.muscache.com/im/pictures/user/a9546fd7-c966-462b-a687-47305540ce73.jpg?im_w=240",
                    hostName: "Akash",
                    hostLocation: "Amravati, India",
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.md),
        ],
      ),
    );
  }
}
