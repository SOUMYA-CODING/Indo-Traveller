import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/utils/sizes.dart';
import 'package:frontend_app/controllers/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColor.textWhite,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: AppSizes.fontSizeSm,
          unselectedFontSize: AppSizes.fontSizeSm,
          selectedItemColor: AppColor.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: dashboardController.currentTabIndex.value,
          onTap: (index) => dashboardController.onTap(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_2),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.map),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.ticket),
              label: "Trips",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => dashboardController.tabScreens[dashboardController.currentTabIndex.value],),
    );
  }
}
