import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';

class ReservationRoomDetailsSection extends StatelessWidget {
  final String image;
  final String propertyType;
  final String title;

  const ReservationRoomDetailsSection({
    super.key,
    required this.image,
    required this.propertyType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            child: Image.network(
              image,
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Room in $propertyType"),
                Text(
                  title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
