import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VerifyEmailController>(
        init: VerifyEmailController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: backButton(),
                ),
                const SizedBox(height: 50,),
                Text(
                  AppText.pleaseCheckEmail,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  AppText.verifyEmailSubText + controller.email,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      AssetsPath.email,
                    ),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        print(controller.isEmail);
                        if(controller.isEmail){
                          Get.toNamed(Routes.REGISTRATION,arguments: {
                            "emailOrMobile": controller.email,
                            "isEmail": controller.isEmail,
                          });
                        }
                        else{
                          Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
                        }
                      },
                      child: commonButton(
                        title: AppText.verifyEmail,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                      },
                      child: commonButtonWithBoarder(
                        title: AppText.sendTheEmailAgain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60,),
              ],
            ),
          );
        }
      ),
    );
  }
}
