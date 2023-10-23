import 'package:flutter/material.dart';
import 'package:frontend_app/config/color.dart';
import 'package:frontend_app/controllers/onboarding/onboarding_controller.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(AppColor.primary),
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
