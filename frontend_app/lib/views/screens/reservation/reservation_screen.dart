import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_app_bar.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_message_section.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_price_section.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_room_details_section.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_trip_section.dart';
import 'package:get/get.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String getPricePerNight = arguments['pricePerNight'];
    final String getPropertyImage = arguments['propertyImage'];
    final String getPropertyType = arguments['propertyType'];
    final String getPropertyTitle = arguments['propertyTitle'];
    final int getPropertyId = arguments['propertyId'];
    final int getUserId = arguments['userId'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ReservationAppBar(),
            const SizedBox(height: AppSizes.spaceBtwItems),
            ReservationRoomDetailsSection(
              image: getPropertyImage,
              propertyType: getPropertyType,
              title: getPropertyTitle,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ReservationTripSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ReservationPriceSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ReservationMessageSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.sm),
                    ),
                  ),
                  onPressed: () => Get.offAllNamed(RouteNames.reservationConfirmScreen),
                  child: Text("Request to book", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColor.textWhite),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


