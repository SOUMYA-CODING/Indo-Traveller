import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class ReservationConfirmScreen extends StatelessWidget {
  const ReservationConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done, color: AppColor.primary, weight: 30, size: AppSizes.iconLg),
            Text("Booking Done", style: Theme.of(context).textTheme.headlineMedium),
            Text("We will notify you after host approved it", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
