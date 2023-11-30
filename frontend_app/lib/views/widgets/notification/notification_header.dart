import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/views/widgets/notification/notification_app_bar.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NotificationAppBar(),
        const SizedBox(height: AppSizes.sm),
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
          child: Text('Notifications',
              style: Theme.of(context).textTheme.headlineLarge!),
        ),
      ],
    );
  }
}
