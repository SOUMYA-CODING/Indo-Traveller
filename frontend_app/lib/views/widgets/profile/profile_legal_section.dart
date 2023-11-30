import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/views/widgets/card/list_tile_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:iconsax/iconsax.dart';

class ProfileLegalSection extends StatelessWidget {
  const ProfileLegalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          CustomSectionHeading(
              title: "Legal", showActionButton: false),
          ListTileCard(
              icon: Iconsax.book_1, title: "Privacy Policy"),
          ListTileCard(
              icon: Iconsax.book_1, title: "Terms of Services"),
        ],
      ),
    );
  }
}
