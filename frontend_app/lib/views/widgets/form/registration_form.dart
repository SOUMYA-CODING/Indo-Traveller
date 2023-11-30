import 'package:flutter/material.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
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
          const SizedBox(height: AppSizes.inputFieldRadius),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              hintText: "Email Address",
              prefixIcon: const Icon(Iconsax.sms),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              hintText: "Phone Number",
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              hintText: "Password",
              prefixIcon: const Icon(Iconsax.lock),
            ),
          ),
          const SizedBox(height: AppSizes.inputFieldRadius),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                borderSide: const BorderSide(color: AppColor.grey),
              ),
              hintText: "Confirm Password",
              prefixIcon: const Icon(Iconsax.lock),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
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
          )
        ],
      ),
    );
  }
}
