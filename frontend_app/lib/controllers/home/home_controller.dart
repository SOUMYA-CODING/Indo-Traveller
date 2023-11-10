import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // RxString userFullname = "".obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUserDetails();
  // }

  // Future<void> getUserDetails() async {
  //   final userData = await AppPreferences.getUserData();
  //   if (userData != null && userData.data != null) {
  //     userFullname.value = userData.data.firstName;
  //   }
  // }
}
