import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/views/widgets/common/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(showBackArrow: true),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultSpace,
                vertical: AppSizes.spaceBtwItems),
            child: Text(
              "Let's create your account",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Row(
              children: [
                Expanded(
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
                      hintText: "First Name",
                      prefixIcon: const Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                Expanded(
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
                      hintText: "Last Name",
                      prefixIcon: const Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
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
                prefixIcon: const Icon(Iconsax.sms),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
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
                hintText: "Phone Number",
                prefixIcon: const Icon(Iconsax.call),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
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
                hintText: "Password",
                prefixIcon: const Icon(Iconsax.lock),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
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
                hintText: "Confirm Password",
                prefixIcon: const Icon(Iconsax.lock),
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
                onPressed: () =>
                    Get.offAllNamed(RouteNames.registrationConfirmScreen),
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
                onPressed: () => Get.back(),
                child: Text(
                  "All ready an user! Sign in",
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
