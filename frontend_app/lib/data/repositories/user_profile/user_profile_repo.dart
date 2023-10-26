import 'package:frontend_app/constants/api_constants.dart';
import 'package:frontend_app/data/model/user_profile_model.dart';
import 'package:frontend_app/dio/dio_client.dart';

class UserProfileRepo{
  final DioClient dioClient = DioClient();

  Future<UserProfileModel> getUserDetailsById(int userId) async {
    final response = await dioClient.get(AppApiConstants.userDetails);
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }
}