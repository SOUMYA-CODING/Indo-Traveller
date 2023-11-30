import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class PropertyReservationSection extends StatelessWidget {
  final String pricePerNight;
  final String propertyImage;
  final String propertyType;
  final String propertyTitle;
  final int propertyId;
  final int userId;

  const PropertyReservationSection({
    super.key,
    required this.pricePerNight,
    required this.propertyImage,
    required this.propertyType,
    required this.propertyTitle,
    required this.propertyId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.imageThumbSize,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultSpace, vertical: AppSizes.sm),
      decoration: const BoxDecoration(
        color: AppColor.white,
        border: Border(
          top: BorderSide(
            color: AppColor.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Rs. $pricePerNight /- night",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace,
                  vertical: AppSizes.md,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.sm),
                ),
              ),
              onPressed: () {
                Get.toNamed(
                  RouteNames.reservationScreen,
                  arguments: {
                    'pricePerNight': pricePerNight,
                    'propertyImage': propertyImage,
                    'propertyType': propertyType,
                    'propertyId': propertyId,
                    'propertyTitle': propertyTitle,
                    'userId': userId,
                  },
                );
              },
              child: Text(
                "Reserve",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColor.textWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
