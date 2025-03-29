import 'package:customer_app/app/modules/home/screens/home_screen.dart';
import 'package:customer_app/app/modules/same_day_delivery/screens/same_day_delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../category/screens/categoty_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../model/navigation_model.dart';

class DashBoardController extends GetxController {

  late List<NavigationModel> screens;
  int pageIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void onInit() {
    // TODO: implement onInit
    pageIndex = Get.arguments as int;
    init();
    super.onInit();
  }

  void init() async{
    screens = [
      NavigationModel(
        name: AppText.home,
        icon: AssetsPath.home,
        iconFilled: AssetsPath.homeFilled,
        screen: const HomeScreen(),
      ),
      NavigationModel(
        name: AppText.sameDay,
        icon: AssetsPath.sameDay,
        iconFilled: AssetsPath.sameDayFilled,
        screen: const SameDayDeliveryScreen(),
      ),
      NavigationModel(
        name: AppText.category,
        icon: AssetsPath.category,
        iconFilled: AssetsPath.categoryFilled,
        screen: const CategoryScreen(),
      ),
      NavigationModel(
        name: AppText.profile,
        icon: AssetsPath.profile,
        iconFilled: AssetsPath.profileFilled,
        screen: const ProfileScreen(),
      ),
    ];
  }

  void setPage(int index) {

    pageIndex = index;
    update();
  }

}
