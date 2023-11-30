import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/devices/device_utility.dart';
import 'package:frontend_app/views/widgets/notification/notification_header.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotificationHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: SizedBox(
                height: AppDeviceUtils.getScreenHeight() / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.notification, size: AppSizes.iconLg),
                    const SizedBox(height: AppSizes.sm),
                    Text("No notification yet",
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                        "For now you don't have any message. We'll let you know when updates arrive!",
                        style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
