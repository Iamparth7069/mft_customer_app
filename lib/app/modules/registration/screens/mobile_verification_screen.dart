import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';
import '../controller/mobile_verification_controller.dart';

class MobileVerificationScreen extends StatelessWidget {
  const MobileVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MobileVerificationController>(
        init: MobileVerificationController(),
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
                  AppText.digitCode,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "${AppText.codeSentTo} ${controller.mobileNumber} ${AppText.alreadyAccount}",
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor,
                  ),
                ),
                const SizedBox(height: 40,),
                CustomTextFieldWidget(
                  controller: controller.codeController,
                  labelText: AppText.digitCode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: (val){
                    controller.countText(val);
                  },
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      AppText.didNotReceive,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        if(controller.secondsRemaining == 0){
                          controller.reStartTimer();
                        }
                      },
                      child: Text(
                        controller.secondsRemaining > 0
                            ? '${AppText.retryIn} ${controller.secondsRemaining}'
                            : AppText.resendOTP,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                controller.isLoading ? loader() : GestureDetector(
                  onTap: (){
                    controller.verify();
                  },
                  child: commonButton(
                    title: controller.isEmail == "password" ? AppText.continueText : AppText.verify,
                    color: !controller.isTextChanged ? AppColor.disableButtonColor : AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          );
        },
      ),
    );
  }
}
