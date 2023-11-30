import 'package:flutter/material.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/review/review_list_controller.dart';
import 'package:frontend_app/views/widgets/card/review_card.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PropertyReviewSection extends StatelessWidget {
  const PropertyReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewListController = Get.put(ReviewListController());
    return Obx(
      () {
        if (reviewListController.reviews.isNotEmpty) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Iconsax.star),
                    const SizedBox(width: AppSizes.spaceBtwItems),
                    Text(
                      "${reviewListController.totalRating} - ${reviewListController.reviews.length} reviews",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: reviewListController.reviews.map((review) {
                        return ReviewCard(
                          userRating: double.parse(review.rating),
                          days: _calculateTimeAgo(review.createdAt),
                          message: review.comment,
                          hostImage: review.user.profilePicture,
                          hostName:
                              "${review.user.firstName} ${review.user.lastName}",
                          hostLocation: review.user.address,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.md),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              children: [
                Text(
                  "No Review Yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
              ],
            ),
          );
        }
      },
    );
  }

  String _calculateTimeAgo(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    }
  }
}
