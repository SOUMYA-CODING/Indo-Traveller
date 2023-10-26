import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class PropertyReservationSection extends StatelessWidget {
  final String pricePerNight;

  const PropertyReservationSection({
    super.key,
    required this.pricePerNight,
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rs. $pricePerNight /- night",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              InkWell(
                onTap: () => Get.toNamed(RouteNames.reservationScreen),
                child: Text(
                  "Nov 1 - 6",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(decoration: TextDecoration.underline),
                ),
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
              onPressed: () => Get.toNamed(RouteNames.reservationScreen),
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
