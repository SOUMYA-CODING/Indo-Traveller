import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';

class CustomTabHeader extends StatelessWidget {
  final String title;

  const CustomTabHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace)
          .copyWith(top: AppSizes.appBarHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge!),
          const Divider(
            color: AppColor.grey,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
