import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/pref_keys.dart';
import '../../../routes/app_pages.dart';
import '../model/slider_model.dart';

class IntroductionController extends GetxController {

  int currentIndex = 0;
  List<SliderModel> slides = [];
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  void init() async{
    slides = [
      SliderModel(title: AppText.intro1Title, description: AppText.intro1description, image: AssetsPath.intro1),
      SliderModel(title: AppText.intro2Title, description: AppText.intro2description, image: AssetsPath.intro2),
      SliderModel(title: AppText.intro3Title, description: AppText.intro3description, image: AssetsPath.intro3),
    ];
  }

  void onChange(int value) {
    currentIndex = value;
    update();
  }

  void changePage() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(PrefConstantsKey.isIntroShow,true);
    Get.offAllNamed(Routes.LOGIN);
    // if (currentIndex < slides.length - 1) {
    //   currentIndex++;
    //   pageController.animateToPage(
    //     currentIndex,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.ease,
    //   );
    // } else {
    //   SharedPreferences preferences = await SharedPreferences.getInstance();
    //   preferences.setBool(PrefConstantsKey.isIntroShow,true);
    //   Get.offAllNamed(Routes.LOGIN);
    // }
    update();
  }

}
