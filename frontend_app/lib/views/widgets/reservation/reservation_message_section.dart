import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';

class ReservationMessageSection extends StatelessWidget {
  const ReservationMessageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Any Message to the Host",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSizes.md),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.sm)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.sm)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.sm)),
                hintText:
                    "Share you'rs travelling, who's is comming with you.."),
          ),
        ],
      ),
    );
  }
}
