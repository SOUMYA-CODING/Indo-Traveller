import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';

class EmptyWishlistSection extends StatelessWidget {
  const EmptyWishlistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create your fist wishlist",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            "As you search, tap on three dot and click on save, to save your favorite places and Experience to a wishlist",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
