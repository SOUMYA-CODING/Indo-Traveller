import 'package:frontend_app/config/preferences.dart';
import 'package:frontend_app/data/model/login_user_model.dart';
import 'package:frontend_app/dio/dio_client.dart';
import 'package:frontend_app/utils/api_urls.dart';

class LoginRepo {
  final DioClient dioClient = DioClient();

  Future<bool> authenticateUser(
      String username, String password, bool rememberMe) async {
    try {
      final response = await dioClient.post(
        AppApiUrls.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final userLoginData = LoginUserModel.fromJson(response.data);

        if (rememberMe) {
          await AppPreferences.saveUserData(userLoginData);
          await AppPreferences.setLoggedIn(true);
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong! $e");
    }
  }
}
