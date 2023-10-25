import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/common/custom_tab_header.dart';
import 'package:frontend_app/views/widgets/wishlist/empty_wishlist_section.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTabHeader(title: "Wishlists"),
            SizedBox(height: AppSizes.spaceBtwItems),
            EmptyWishlistSection(),
          ],
        ),
      ),
    );
  }
}
