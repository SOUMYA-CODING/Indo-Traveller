import 'package:flutter/material.dart';
import 'package:frontend_app/utils/assets.dart';
import 'package:frontend_app/utils/extension.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/utils/strings.dart';
import 'package:frontend_app/controllers/onboarding/onboarding_controller.dart';
import 'package:frontend_app/devices/device_utility.dart';
import 'package:frontend_app/views/widgets/onboarding/onboarding_button.dart';
import 'package:frontend_app/views/widgets/onboarding/onboarding_dot_indicator.dart';
import 'package:frontend_app/views/widgets/onboarding/onboarding_page.dart';
import 'package:frontend_app/views/widgets/onboarding/onboarding_skip.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.updatePageIndicator,
            children: const [
              OnboardingPage(
                headline: AppStrings.onboardingHeadlineOne,
                description: AppStrings.onboardingDescriptionOne,
                imagePath: AppAssets.onboardingImageOne,
              ),
              OnboardingPage(
                headline: AppStrings.onboardingHeadlineTwo,
                description: AppStrings.onboardingDescriptionTwo,
                imagePath: AppAssets.onboardingImageTwo,
              ),
              OnboardingPage(
                headline: AppStrings.onboardingHeadlineThree,
                description: AppStrings.onboardingDescriptionThree,
                imagePath: AppAssets.onboardingImageThree,
              ),
            ],
          ),
          Positioned(
            top: AppDeviceUtils.getAppBarHeight(),
            right: AppSizes.sm,
            child: const OnboardingSkip(),
          ),
          Positioned(
            bottom: AppSizes.sm,
            left: AppSizes.sm,
            right: AppSizes.sm,
            child: Padding(
              padding: EdgeInsets.all(5.0.wp),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnboardingDotIndicator(),
                  OnboardingButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
