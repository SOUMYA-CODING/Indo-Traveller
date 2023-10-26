import 'package:frontend_app/data/model/property_details_model.dart';
import 'package:frontend_app/data/repositories/property/property_repo.dart';
import 'package:get/get.dart';

class PropertyDetailsController extends GetxController {
  static PropertyDetailsController get instance => Get.find();

  final PropertyRepo propertyRepo = PropertyRepo();
  final Rx<Data> propertyDetails = Data(
          id: 0,
          propertyImages: [],
          amenities: [],
          title: '',
          description: '',
          pricePerNight: '',
          state: '',
          city: '',
          address: '',
          numberOfQueenBedrooms: 0,
          numberOfQueenBeds: 0,
          numberOfKingBeds: 0,
          numberOfDoubleBeds: 0,
          numberOfSingleBeds: 0,
          isActive: true,
          isReserved: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          host: 0,
          propertyType: 0)
      .obs;


  Future<void> fetchPropertyDetailsFromId(int propertyId) async {
    try {
      final response = await propertyRepo.getPropertyDetailsFromId(propertyId);
      propertyDetails.value = response.data;
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
