import 'package:frontend_app/data/repositories/review/review_list_repo.dart';
import 'package:get/get.dart';

import 'package:frontend_app/data/model/review_list_model.dart';

class ReviewListController extends GetxController {
  static ReviewListController get instance => Get.find();

  final ReviewListRepo reviewListRepo = ReviewListRepo();
  RxList<Datum> reviews = <Datum>[].obs;
  RxDouble totalRating = 0.0.obs;


  Future<void> fetchReviewListFromPropertyId(int propertyId) async {
    try {
      final response = await reviewListRepo.getReviewListByPropertyId(propertyId);
      reviews.assignAll(response.data);
      totalRating.value = response.totalRating;
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
