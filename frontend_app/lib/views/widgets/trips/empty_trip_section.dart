import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/dashboard/dashboard_controller.dart';

class EmptyTripSection extends StatelessWidget {
  const EmptyTripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "No trips booked..yet!",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            "Time to dust off your bags and start planning your next adventure",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSizes.md),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColor.black),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(AppSizes.cardRadiusMd),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace,
                  vertical: AppSizes.md),
            ),
            onPressed: () => DashboardController.instance.onTap(1),
            child: Text(
              "Start Searching",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
