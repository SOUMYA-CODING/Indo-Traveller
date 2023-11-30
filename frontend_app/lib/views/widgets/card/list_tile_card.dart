import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ListTileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ListTileCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.grey))),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: AppSizes.sm),
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Iconsax.arrow_right_3),
        onTap: onTap,
      ),
    );
  }
}
