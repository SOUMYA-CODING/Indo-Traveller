import 'package:flutter/material.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/utils/assets.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/views/widgets/form/login_form.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace)
            .copyWith(top: AppSizes.appBarHeight + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSizes.appBarHeight + 10),
            Image.asset(
              AppAssets.appLogo,
              width: 100,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Text(
                "Log in or sign up to IndoTraveller",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const LoginForm(),
            const SizedBox(height: AppSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
                  ),
                ),
                onPressed: () => Get.toNamed(RouteNames.registrationScreen),
                child: Text(
                  "News User! Sign up",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
