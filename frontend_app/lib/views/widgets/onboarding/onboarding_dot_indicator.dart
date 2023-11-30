import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/controllers/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());
    return SmoothPageIndicator(
        controller: onboardingController.pageController,
        onDotClicked: onboardingController.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
          activeDotColor: AppColor.primary,
          dotHeight: 6,
        ),
      );
  }
}
