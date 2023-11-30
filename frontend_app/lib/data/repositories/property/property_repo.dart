import 'package:frontend_app/utils/api_urls.dart';
import 'package:frontend_app/data/model/property_details_model.dart';
import 'package:frontend_app/data/model/property_list_model.dart';
import 'package:frontend_app/dio/dio_client.dart';

class PropertyRepo {
  final DioClient dioClient = DioClient();

  // All List
  Future<PropertyListModel> getAllPropertyList() async {
    final response = await dioClient.get(AppApiUrls.propertyList);
    if (response.statusCode == 200) {
      return PropertyListModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }

  // Single Property Details From ID
  Future<PropertyDetailsModel> getPropertyDetailsFromId(int propertyId) async {
    final response = await dioClient.get("${AppApiUrls.propertyList}/$propertyId");
    if (response.statusCode == 200) {
      return PropertyDetailsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }
}
