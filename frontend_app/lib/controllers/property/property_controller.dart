import 'package:frontend_app/data/model/property_model.dart';
import 'package:frontend_app/data/repositories/property/property_repo.dart';
import 'package:get/get.dart';

class PropertyController extends GetxController {
  static PropertyController get instance => Get.find();

  final PropertyRepo propertyRepo = PropertyRepo();
  RxList<Datum> propertyList = <Datum>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchAllPropertyList();
  }

  Future<void> fetchAllPropertyList() async {
    try {
      final response = await propertyRepo.getAllPropertyList();
      propertyList.addAll(response.results.data);
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
