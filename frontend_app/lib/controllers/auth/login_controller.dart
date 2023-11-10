import 'package:flutter/widgets.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/data/repositories/auth/login_repo.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final LoginRepo loginRepo = LoginRepo();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = false.obs;

  var isLoading = false.obs;

  void showSnackBar(String message) => Get.snackbar("Indo Traveller", message,
      margin: const EdgeInsets.all(AppSizes.defaultSpace));

  Future<void> authenticateUser() async {
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();

    try {
      isLoading(true);
      final isAuthenticated = await loginRepo.authenticateUser(
          username, password, rememberMe.value);
      if (isAuthenticated) {
        showSnackBar("Login Success");
        Get.offAllNamed(RouteNames.dashboardScreen);
      } else {
        showSnackBar("Login Failed");
      }
    } catch (e) {
      showSnackBar("Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
