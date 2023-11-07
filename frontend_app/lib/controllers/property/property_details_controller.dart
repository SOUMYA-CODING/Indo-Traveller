import 'package:frontend_app/data/model/property_details_model.dart';
import 'package:frontend_app/data/repositories/property/property_repo.dart';
import 'package:get/get.dart';

class PropertyDetailsController extends GetxController {
  static PropertyDetailsController get instance => Get.find();

  final PropertyRepo propertyRepo = PropertyRepo();
  var propertyDetails = Rx<Data?>(null);
  var isLoading = false.obs;
  RxInt activeImageIndex = 0.obs;

  void setActiveImageIndex(int index) => activeImageIndex.value = index;

  Future<void> fetchPropertyDetailsFromId(int propertyId) async {
    try {
      isLoading(true);
      final response = await propertyRepo.getPropertyDetailsFromId(propertyId);
      propertyDetails.value = response.data;
    } catch (e) {
      throw Exception("Error $e");
    } finally {
      isLoading(true);
    }
  }
}
