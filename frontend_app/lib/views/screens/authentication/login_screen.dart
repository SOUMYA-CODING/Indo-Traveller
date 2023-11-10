import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/auth/login_controller.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

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
              controller: loginController.userNameController,
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
              controller: loginController.passwordController,
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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => CupertinoCheckbox(
                    value: loginController.rememberMe.value,
                    onChanged: (bool? value) {
                      if (value != null) {
                        loginController.rememberMe.value = value;
                      }
                    },
                  ),
                ),
                Text(
                  "Remember Me",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Get.toNamed(RouteNames.passwordResetScreen),
                  child: Text(
                    "Forgot Password ?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
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
                onPressed: () => loginController.authenticateUser(),
                child: Obx(
                  () {
                    if (loginController.isLoading.value) {
                      return const CircularProgressIndicator(
                          color: AppColor.white);
                    } else {
                      return Text(
                        "Continue",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.textWhite),
                      );
                    }
                  },
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
