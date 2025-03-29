import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/pref_keys.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      // Received changes in available connectivity types!
    });
    init();
    super.onInit();
  }

  void init() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isIntroShow = preferences.getBool(PrefConstantsKey.isIntroShow) ?? false;
    String userId = preferences.getString(PrefConstantsKey.userId) ?? "0";
    preferences.setString(PrefConstantsKey.selectedCity, "");
    print("userId $userId");
    print(isIntroShow);
    if(isIntroShow){
      // Future.delayed(const Duration(seconds: 2),(){
      //   Get.offAllNamed(Routes.LOGIN);
      // });
      if(userId != "0"){
        Future.delayed(const Duration(seconds: 2),(){
          Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
        });
      }
      else{
        Future.delayed(const Duration(seconds: 2),(){
          Get.offAllNamed(Routes.LOGIN);
        });
      }
    }
    else{
      Future.delayed(const Duration(seconds: 2),(){
        Get.offAllNamed(Routes.INTRO);
        // Get.offAllNamed(Routes.DASHBOARD);
      });
    }
  }

}
