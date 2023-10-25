import 'package:frontend_app/views/screens/dashboard/tabs/explore_tab.dart';
import 'package:frontend_app/views/screens/dashboard/tabs/home_tab.dart';
import 'package:frontend_app/views/screens/dashboard/tabs/profile_tab.dart';
import 'package:frontend_app/views/screens/dashboard/tabs/trip_tab.dart';
import 'package:frontend_app/views/screens/dashboard/tabs/wishlist_tab.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  var currentTabIndex = 0.obs;

  List tabScreens = [
    const HomeTab(),
    const ExploreTab(),
    const WishlistTab(),
    const TripTab(),
    const ProfileTab(),
  ];

  void onTap(index) => currentTabIndex.value = index;
}
