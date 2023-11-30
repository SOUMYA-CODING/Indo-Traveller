import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/extension.dart';
import 'package:frontend_app/utils/sizes.dart';

class PropertyTypeCard extends StatelessWidget {
  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  const PropertyTypeCard({
    super.key,
    required this.title,
    required this.image,
    this.backgroundColor = AppColor.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(1.0.wp),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              ),
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: AppSizes.iconLg,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
