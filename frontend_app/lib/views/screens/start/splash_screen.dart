import 'package:flutter/material.dart';
import 'package:frontend_app/utils/assets.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/utils/strings.dart';
import 'package:frontend_app/controllers/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appLogo,
                width: 65,
              ),
              const SizedBox(height: AppSizes.defaultSpace),
              Text(
                AppStrings.appName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
