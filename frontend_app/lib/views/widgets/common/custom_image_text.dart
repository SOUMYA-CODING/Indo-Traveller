import 'package:flutter/material.dart';
import 'package:frontend_app/constants/extension.dart';
import 'package:frontend_app/constants/sizes.dart';

class CustomImageText extends StatelessWidget {
  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  const CustomImageText({
    super.key,
    required this.title,
    required this.image,
    this.backgroundColor = Colors.white,
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
                borderRadius: BorderRadius.circular(10),
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
