import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/views/widgets/card/list_tile_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:iconsax/iconsax.dart';

class ProfileSettingSection extends StatelessWidget {
  const ProfileSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          CustomSectionHeading(
              title: "Settings", showActionButton: false),
          ListTileCard(
              icon: Iconsax.user, title: "Personal information"),
          ListTileCard(
              icon: Iconsax.shield, title: "Login & security"),
          ListTileCard(
              icon: Iconsax.notification, title: "Notification"),
        ],
      ),
    );
  }
}
