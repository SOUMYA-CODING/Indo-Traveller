import 'package:frontend_app/constants/api_constants.dart';
import 'package:frontend_app/data/model/review_list_model.dart';
import 'package:frontend_app/dio/dio_client.dart';

class ReviewListRepo {
  final DioClient dioClient = DioClient();

  Future<ReviewListModel> getReviewListByPropertyId(int propertyId) async {
    final response = await dioClient.get("${AppApiConstants.reviewList}/$propertyId");
    if (response.statusCode == 200) {
      return ReviewListModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch property types');
    }
  }
}
