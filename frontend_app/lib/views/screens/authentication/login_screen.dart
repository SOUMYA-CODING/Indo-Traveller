import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace)
                    .copyWith(top: AppSizes.appBarHeight + 10),
            child: Text(
              "Log in or sign up to IndoTraveller",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                hintText: "Email Address",
                prefixIcon: const Icon(Iconsax.message),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                hintText: "Password",
                prefixIcon: const Icon(Iconsax.lock),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: TextButton(
                onPressed: () => Get.toNamed(RouteNames.passwordResetScreen),
                child: Text(
                  "Password Reset ?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
                  ),
                ),
                onPressed: () => Get.toNamed(RouteNames.dashboardScreen),
                child: Text(
                  "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColor.textWhite),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: SizedBox(
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
          ),
        ],
      ),
    );
  }
}
