import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
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
                  AppText.forgotPassword,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  AppText.forgotPasswordSubText,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor
                  ),
                ),
                const SizedBox(height: 30,),
                CustomTextFieldWidget(
                  controller: controller.emailMobileController,
                  labelText: AppText.emailMobile,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text){
                    controller.changeText(text);
                  },
                ),
                const SizedBox(height: 50,),
                controller.isLoading ? loader() : GestureDetector(
                  onTap: (){
                    controller.checkIsEmail();
                  },
                  child: commonButton(
                    title: AppText.continueText,
                    color: !controller.isTextChanged ? AppColor.disableButtonColor : AppColor.mainTextColor,
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
