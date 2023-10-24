import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/extension.dart';
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
          backgroundColor: Colors.white30,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 9.0.sp,
          unselectedFontSize: 9.0.sp,
          selectedItemColor: AppColor.primary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: dashboardController.currentTabIndex.value,
          onTap: (index) => dashboardController.onTap(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.map),
              label: "Explore",
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
