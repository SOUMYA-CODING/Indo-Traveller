import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/controllers/property_type/property_type_controller.dart';
import 'package:frontend_app/views/widgets/card/property_type_card.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:get/get.dart';

class HomePropertyType extends StatelessWidget {
  const HomePropertyType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final propertyTypeController = Get.put(PropertyTypeController());
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
      child: Column(
        children: [
          const CustomSectionHeading(
            title: "Property",
            showActionButton: false,
            textColor: AppColor.textWhite,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            height: 90,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: propertyTypeController.propertyTypeList.length,
                itemBuilder: (_, index) {
                  final propertyType =
                      propertyTypeController.propertyTypeList[index];
                  return PropertyTypeCard(
                    image: propertyType.icon,
                    title: propertyType.name,
                    onTap: () {
                      debugPrint(
                          "This is ${propertyType.name} and ID is ${propertyType.id}");
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
