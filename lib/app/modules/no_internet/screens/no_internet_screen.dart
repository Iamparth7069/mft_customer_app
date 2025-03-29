import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.5,
            child: Stack(
              children: [
                Image.asset(
                  AssetsPath.noInternetBg,
                  height: Get.height * 0.4,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AssetsPath.noInternet,
                    width: 202,
                    height: 202,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Text(
                  AppText.connectionFailed,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  AppText.connectionFailedSubText,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () async{
                    var connectivityResult = await Connectivity().checkConnectivity();
                    if (connectivityResult[0] != ConnectivityResult.none) {
                      Get.offAllNamed(Routes.SPLASH);
                    }
                  },
                  child: commonButton(title: AppText.tryAgain),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
