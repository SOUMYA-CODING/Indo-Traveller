import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';

class ReservationTripSection extends StatelessWidget {
  const ReservationTripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ("Your Trip"),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dates",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Edit",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          Text("Apr 22 - 29, 2024", style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Guests",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Edit",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          Text("1 guest", style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
