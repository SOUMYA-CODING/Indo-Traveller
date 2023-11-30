import 'package:flutter/material.dart';
import 'package:frontend_app/utils/assets.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class RegistrationConfirmScreen extends StatelessWidget {
  const RegistrationConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace)
            .copyWith(top: AppSizes.appBarHeight),
        child: Column(
          children: [
            Image.asset(AppAssets.doneIcon),
            Text(
              "Your account successfully created!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              "Welcome to IndoTraveller. Your account has been created. Unleased the power of this platform start booking, enjoy your have some leaur time.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .merge(const TextStyle(fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
                  ),
                ),
                onPressed: () => Get.toNamed(RouteNames.loginScreen),
                child: Text(
                  "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColor.textWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
