import 'package:frontend_app/utils/api_urls.dart';
import 'package:frontend_app/data/model/property_type_model.dart';
import 'package:frontend_app/dio/dio_client.dart';

class PropertyTypeRepo {
  final DioClient dioClient = DioClient();

  Future<PropertyTypeModel> getPropertyTypes() async {
    final response = await dioClient.get(AppApiUrls.propertyType);
    if (response.statusCode == 200) {
      return PropertyTypeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }
}
