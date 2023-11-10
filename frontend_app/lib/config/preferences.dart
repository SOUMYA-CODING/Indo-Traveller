import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_app/data/model/login_user_model.dart';

class AppPreferences{
  static const storage = FlutterSecureStorage();
  static const String keyAccessToken = 'access_token';
  static const String keyUserData = 'user_data';
  static const String keyLoggedInStatus = 'logged_in_status';
  static const String keyOnboardingStatus = 'onboarding_status';

  static Future<void> saveOnboardingStatus(bool status) async {
    await storage.write(key: keyOnboardingStatus, value: status.toString());
  }

  static Future<bool> getOnboardingStatus() async {
    final status = await storage.read(key: keyOnboardingStatus);
    return status == 'true';
  }

  static Future<void> saveUserData(LoginUserModel user) async {
    final userDataJson = loginUserModelToJson(user);
    await storage.write(key: keyUserData, value: userDataJson);
  }

  static Future<LoginUserModel?> getUserData() async {
    final userDataJson = await storage.read(key: keyUserData);
    if (userDataJson != null) {
      return loginUserModelFromJson(userDataJson);
    } else {
      return null;
    }
  }

  static Future<void> clearUserData() async {
    await storage.delete(key: keyUserData);
  }

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    await storage.write(key: keyLoggedInStatus, value: isLoggedIn.toString());
  }

  static Future<bool> isLoggedIn() async {
    final isLoggedIn = await storage.read(key: keyLoggedInStatus);
    return isLoggedIn == 'true';
  }

  static Future<void> clearLoggedInStatus() async {
    await storage.delete(key: keyLoggedInStatus);
  }

  static Future<void> logout() async {
    await clearUserData();
    await clearLoggedInStatus();
  }
}