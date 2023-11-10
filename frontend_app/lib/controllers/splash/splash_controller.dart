import 'dart:async';

import 'package:frontend_app/config/preferences.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(RouteNames.loginScreen),
    );
  }

  Future<void> navigateUser() async {
    final hasCompletedOnboarding = await AppPreferences.getOnboardingStatus();
    final isLoggedIn = await AppPreferences.isLoggedIn();

    if (!hasCompletedOnboarding) {
      await AppPreferences.saveOnboardingStatus(true);
      Get.offNamed(RouteNames.onboardingScreen);
    } else 
    if (isLoggedIn) {
      Get.offNamed(RouteNames.dashboardScreen);
    } else {
      Get.offNamed(RouteNames.loginScreen);
    }
  }
}
