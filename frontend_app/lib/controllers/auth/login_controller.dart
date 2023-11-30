import 'package:flutter/widgets.dart';
import 'package:frontend_app/helper/helper_function.dart';
import 'package:frontend_app/data/repositories/auth/login_repo.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final LoginRepo loginRepo = LoginRepo();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() =>
      isPasswordVisible(!isPasswordVisible.value);

  Future<void> authenticateUser() async {
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();

    try {
      isLoading(true);
      final isAuthenticated = await loginRepo.authenticateUser(
          username, password, rememberMe.value);
      if (isAuthenticated) {
        AppHelperFunctions.showSnackBar("Login Success");
        Get.offAllNamed(RouteNames.dashboardScreen);
      } else {
        AppHelperFunctions.showSnackBar("Login Failed! Invalid username or password");
      }
    } catch (e) {
      AppHelperFunctions.showSnackBar("Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
