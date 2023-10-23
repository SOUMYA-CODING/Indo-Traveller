import 'package:frontend_app/data/model/property_type_model.dart';
import 'package:frontend_app/data/repositories/property_type/property_type_repo.dart';
import 'package:get/get.dart';

class PropertyTypeController extends GetxController{
  static PropertyTypeController get instance => Get.find();

  final PropertyTypeRepo propertyTypeRepo = PropertyTypeRepo();
  RxList<Datum> propertyTypeList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPropertyTypes();
  }

  Future<void> fetchPropertyTypes() async {
    try {
      final response = await propertyTypeRepo.getPropertyTypes();
      propertyTypeList.assignAll(response.data);
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}