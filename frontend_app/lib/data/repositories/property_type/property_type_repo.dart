import 'package:frontend_app/constants/api_constants.dart';
import 'package:frontend_app/data/model/property_type_model.dart';
import 'package:frontend_app/dio/dio_client.dart';

class PropertyTypeRepo {
  final DioClient dioClient = DioClient();

  Future<PropertyType> getPropertyTypes() async {
    final response = await dioClient.get(AppApiConstants.propertyType);
    if (response.statusCode == 200) {
      return PropertyType.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }
}
