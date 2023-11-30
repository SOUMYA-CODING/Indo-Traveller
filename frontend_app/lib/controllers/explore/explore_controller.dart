import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/devices/device_utility.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  static ExploreController get instance => Get.find();

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: AppDeviceUtils.getScreenHeight(),
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: const Text('This is the bottom sheet content'),
      ),
      backgroundColor: AppColor.white,
    );
  }
}
