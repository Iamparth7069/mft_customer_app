import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(),
                  ],
                ),
                const SizedBox(height: 50,),
                Text(
                  "${AppText.letsGetStarted}!",
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  AppText.enterEmailId,
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
                    controller.validateEmail();
                  },
                  child: commonButton(
                    title: AppText.continueText,
                    color: !controller.isTextChanged ? AppColor.disableButtonColor : AppColor.mainTextColor,
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        color: AppColor.dividerColor,
                        thickness: 1
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Or",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColor.dividerColor,
                        thickness: 1
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 30,),
                controller.isGoogleLoading ? loader() : GestureDetector(
                  onTap: (){
                    controller.signInWithGoogle();
                  },
                  child: Container(
                    width: Get.width,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColor.lineDarkBoarderColor),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Image(
                          image: AssetImage(AssetsPath.google),
                          height: 24.0,
                          width: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            AppText.continueWithGoogle,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
