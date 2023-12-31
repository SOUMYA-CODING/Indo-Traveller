import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/property/property_details_controller.dart';
import 'package:frontend_app/controllers/review/review_list_controller.dart';
import 'package:frontend_app/routes/route_names.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PropertyCard extends StatelessWidget {
  final int id;
  final String price;
  final String location;
  final String image;

  const PropertyCard({
    super.key,
    required this.id,
    required this.price,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final property = Get.put(PropertyDetailsController());
    final review = Get.put(ReviewListController());
    return GestureDetector(
      onTap: () async {
        await property.fetchPropertyDetailsFromId(id);
        await review.fetchReviewListFromPropertyId(id);
        Get.toNamed(RouteNames.propertyDetailsScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: AppSizes.sm,
                  top: AppSizes.sm,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart5,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Rs. $price /- night",
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
