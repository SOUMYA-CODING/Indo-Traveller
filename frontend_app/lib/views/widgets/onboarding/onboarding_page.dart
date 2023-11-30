import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/helper/helper_function.dart';

class OnboardingPage extends StatelessWidget {
  final String headline;
  final String description;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.headline,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: AppHelperFunctions.screenWidth() * 0.8,
            height: AppHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(imagePath),
          ),
          Text(
            headline,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .merge(const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
