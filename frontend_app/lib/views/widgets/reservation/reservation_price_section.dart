import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class ReservationPriceSection extends StatelessWidget {
  const ReservationPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ("Price Details"),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rs. 2500 x 7 nights",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Rs. 17500", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cleaning fee",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Rs. 500", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Service fee", style: Theme.of(context).textTheme.bodyLarge),
              Text("Rs. 1500", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const Divider(color: AppColor.grey, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: Theme.of(context).textTheme.bodyLarge),
              Text("Rs. 19500", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}
