import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_app/controllers/auth/login_controller.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final loginController = Get.put(LoginController());

    return Obx(
      () => Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: loginController.userNameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
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
                prefixIcon: const Icon(Iconsax.user),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.inputFieldRadius),
            TextFormField(
              obscureText: loginController.isPasswordVisible.value,
              controller: loginController.passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.inputFieldRadius),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
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
                suffixIcon: GestureDetector(
                  onTap: () => loginController.togglePasswordVisibility(),
                  child: Icon(
                    loginController.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoCheckbox(
                  value: loginController.rememberMe.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      loginController.rememberMe.value = value;
                    }
                  },
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
            const SizedBox(height: AppSizes.spaceBtwItems),
            loginController.isLoading.value
                ? const CircularProgressIndicator(
                    color: AppColor.primary,
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.cardRadiusMd),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginController.authenticateUser();
                        }
                      },
                      child: Text(
                        "Continue",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.textWhite),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
