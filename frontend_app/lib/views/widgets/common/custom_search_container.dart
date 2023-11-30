import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/devices/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  const CustomSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Container(
          width: AppDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder
                ? Border.all(color: AppColor.white)
                : Border.all(color: AppColor.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: Theme.of(context).textTheme.bodyMedium),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
