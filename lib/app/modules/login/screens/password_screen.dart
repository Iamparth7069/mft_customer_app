import 'package:customer_app/app/modules/login/controller/password_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<PasswordController>(
        init: PasswordController(),
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
                  AppText.enterYourPassword,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  AppText.enterYourPasswordSubText,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor,
                  ),
                ),
                const SizedBox(height: 30,),
                CustomTextFieldWidget(
                  isObscure: controller.isTextObscure,
                  controller: controller.passwordController,
                  labelText: AppText.password,
                  maxLines: 1,
                  suffix: GestureDetector(
                    onTap: (){
                      controller.showPassword();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: !controller.isTextObscure ? Image.asset(
                        AssetsPath.eyeHide,
                        height: 19,
                        color: AppColor.greyLightIconColor,
                      ) : Image.asset(
                        AssetsPath.eyeShow,
                        height: 15,
                      ),
                    ),
                  ),
                  onChanged: (text){
                    controller.changeText(text);
                  },
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.FORGOTPASSWORD);
                  },
                  child: Text(
                    AppText.forgotYourPassword,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.easternBlueColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                controller.isLoading ? loader() : GestureDetector(
                  onTap: (){
                    // Get.offAllNamed(Routes.DASHBOARD);
                    controller.login();
                  },
                  child: commonButton(
                    title: AppText.continueText,
                    color: !controller.isTextChanged ? AppColor.disableButtonColor : AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 20,),
                controller.isEmailLoading ? loader() : GestureDetector(
                  onTap: (){
                    controller.checkIsEmail();
                    // Get.toNamed(Routes.MOBILEVERIFICATION,arguments: {
                    //   "emailOrMobile": controller.emailOrMobile,
                    //   "isEmail": "password",
                    // });
                  },
                  child: commonButtonWithBoarder(
                    title: AppText.loginThroughOTP,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
