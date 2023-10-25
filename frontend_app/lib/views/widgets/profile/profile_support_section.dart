import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/card/list_tile_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:iconsax/iconsax.dart';

class ProfileSupportSection extends StatelessWidget {
  const ProfileSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          CustomSectionHeading(
              title: "Support", showActionButton: false),
          ListTileCard(
              icon: Iconsax.message_question, title: "Help Center"),
          ListTileCard(
              icon: Iconsax.headphone, title: "Report an issue"),
          ListTileCard(
              icon: Iconsax.message, title: "Give us feedback"),
        ],
      ),
    );
  }
}
