import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/views/widgets/common/custom_tab_header.dart';
import 'package:frontend_app/views/widgets/trips/empty_trip_section.dart';

class TripTab extends StatelessWidget {
  const TripTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTabHeader(title: "Trip"),
            SizedBox(height: AppSizes.spaceBtwItems),
            EmptyTripSection(),
          ],
        ),
      ),
    );
  }
}
