import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/views/widgets/common/custom_tab_header.dart';
import 'package:frontend_app/views/widgets/profile/profile_legal_section.dart';
import 'package:frontend_app/views/widgets/profile/profile_settings_section.dart';
import 'package:frontend_app/views/widgets/profile/profile_support_section.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTabHeader(title: "Profile"),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: AppSizes.sm),
                leading: CircleAvatar(
                  radius: AppSizes.iconLg,
                  backgroundColor: AppColor.darkerGrey,
                  child: Text(
                    "S",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColor.textWhite),
                  ),
                ),
                title: Text("Soumya",
                    style: Theme.of(context).textTheme.headlineMedium),
                subtitle: Text("Your Profile",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: const Icon(Iconsax.arrow_right_3),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ProfileSettingSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ProfileSupportSection(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const ProfileLegalSection(),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.offAllNamed(RouteNames.loginScreen),
                    child: Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const Divider(color: AppColor.grey, thickness: 1),
                  Text("Version 1.0.1",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
