import 'package:frontend_app/utils/api_urls.dart';
import 'package:frontend_app/dio/dio_client.dart';

class RegistrationRepo {
  final DioClient dioClient = DioClient();

  Future<Map<String, dynamic>> createUser(
      String firstName,
      String lastName,
      String emailAddress,
      String phoneNumber,
      String userName,
      String password) async {
    try {
      final response = await dioClient.post(
        AppApiUrls.registration,
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": emailAddress,
          "phone_number": phoneNumber,
          "username": userName,
          "password": password,
          "user_type": "Guest"
        },
      );

      if (response.statusCode == 201) {
        return {"success": true, "message": "${response.data["message"]}"};
      } else {
        return {"success": false, "message": "${response.data["message"]}"};
      }
    } catch (e) {
      return {"success": true, "message": "Something went wrong"};
    }
  }
}
