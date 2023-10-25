
import 'package:flutter/material.dart';
import 'package:frontend_app/views/widgets/common/custom_app_bar.dart';
import 'package:get/get.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: true,
      leadingOnPress: () => Get.back(),
    );
  }
}
