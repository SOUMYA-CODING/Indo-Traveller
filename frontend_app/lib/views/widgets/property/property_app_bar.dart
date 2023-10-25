import 'package:flutter/material.dart';
import 'package:frontend_app/views/widgets/common/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

class PropertyAppBar extends StatelessWidget {
  const PropertyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.heart),
        ),
      ],
    );
  }
}