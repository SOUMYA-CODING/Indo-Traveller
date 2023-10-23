import 'package:flutter/material.dart';
import 'package:frontend_app/views/widgets/common/custom_app_bar.dart';
import 'package:frontend_app/views/widgets/notification/notification_counter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good day for traveling",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
          Text(
            "Soumya Prakash Sahu",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        NotificationCounter(
          onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
