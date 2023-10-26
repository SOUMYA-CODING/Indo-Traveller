import 'package:frontend_app/data/model/user_profile_model.dart';
import 'package:frontend_app/data/repositories/user_profile/user_profile_repo.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  final UserProfileRepo userProfileRepo = UserProfileRepo();
  final Rx<Data> userProfileDetails = Data(
          id: 0,
          profilePicture: "",
          password: "",
          username: "",
          firstName: "",
          lastName: "",
          email: "",
          isActive: false,
          isSuperuser: false,
          userType: "",
          phoneNumber: "",
          address: "")
      .obs;

  Future<void> fetchUserDetailsFromId(int userId) async {
    try {
      final response = await userProfileRepo.getUserDetailsById(userId);
      userProfileDetails.value = response.data;
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
