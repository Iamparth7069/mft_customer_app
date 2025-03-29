import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';
import '../controller/new_password_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NewPasswordController>(
        init: NewPasswordController(),
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
                  AppText.sentNewPassword,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  AppText.sentNewPasswordSubText,
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
                  labelText: AppText.newPassword,
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
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: controller.strength / 5,
                          minHeight: 4,
                          borderRadius: BorderRadius.circular(8),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            controller.indicatorColor
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      if (controller.strengthText.isEmpty) Container() else SizedBox(
                        width: 70,
                        child: Text(
                          controller.strengthText,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainTextColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                CustomTextFieldWidget(
                  isObscure: controller.isTextConfirmObscure,
                  controller: controller.confirmPasswordController,
                  labelText: AppText.confirmPassword,
                  maxLines: 1,
                  suffix: GestureDetector(
                    onTap: (){
                      controller.showConfirmPassword();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: !controller.isTextConfirmObscure ? Image.asset(
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
                const SizedBox(height: 50,),
                controller.isLoading ? loader() : GestureDetector(
                  onTap: (){
                    controller.resetPassword();
                  },
                  child: commonButton(
                    title: AppText.setPassword,
                    color: AppColor.mainTextColor,
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
