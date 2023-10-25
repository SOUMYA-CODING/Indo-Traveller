import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';

class PropertyImageSection extends StatefulWidget {
  const PropertyImageSection({super.key});

  @override
  State<PropertyImageSection> createState() => _PropertyImageSectionState();
}

class _PropertyImageSectionState extends State<PropertyImageSection> {
  List getList = [
    "https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=1200",
    "https://a0.muscache.com/im/pictures/miso/Hosting-804959254707180514/original/fdba3a5f-da62-4b50-83ea-517639ba1385.jpeg?im_w=1200",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
                child: Image.network(
                  "https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=1200",
                  height: 380,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: AppSizes.md,
                right: AppSizes.md,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.md, vertical: AppSizes.sm),
                  decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(AppSizes.sm)),
                  child: Text(
                    "1 / 5",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.textWhite),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
