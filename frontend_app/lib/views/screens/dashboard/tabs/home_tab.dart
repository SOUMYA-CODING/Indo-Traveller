import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/common/custom_header.dart';
import 'package:frontend_app/views/widgets/common/custom_search_container.dart';
import 'package:frontend_app/views/widgets/common/custom_section_heading.dart';
import 'package:frontend_app/views/widgets/home/home_app_bar.dart';
import 'package:frontend_app/views/widgets/home/home_property_type.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  CustomSearchContainer(text: 'Search Places'),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  HomePropertyType(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: CustomSectionHeading(
                title: "Recommended Places",
                showActionButton: true,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems - 10),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: AppSizes.spaceBtwItems),
                        child: Container(
                          width: 250,
                          height: 250,
                          padding: const EdgeInsets.all(AppSizes.defaultSpace),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizes.cardRadiusLg),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://a0.muscache.com/im/pictures/33bd05ed-6c29-4d74-99a6-201ff74e53d1.jpg?im_w=1200"),
                              fit: BoxFit.cover,
                              opacity: 0.8,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Kalapathar Beach",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: AppColor.textWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
