import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/card/property_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';

class HomeYourDestination extends StatelessWidget {
  const HomeYourDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: CustomSectionHeading(
            title: "Your Destination",
            showActionButton: false,
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSizes.gridViewSpacing,
              crossAxisSpacing: AppSizes.gridViewSpacing,
              mainAxisExtent: 200,
            ),
            itemBuilder: (_, index) => const PropertyCard(
              id: 5,
              price: 2500,
              location: "Havelock Island",
              image:
                  "https://a0.muscache.com/im/pictures/33bd05ed-6c29-4d74-99a6-201ff74e53d1.jpg?im_w=1200",
            ),
          ),
        ),
      ],
    );
  }
}
