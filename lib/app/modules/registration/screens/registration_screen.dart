import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
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
                    AppText.tellAsAbout,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    AppText.tellAsAboutSubText,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  CustomTextFieldWidget(
                    controller: controller.fullNameController,
                    labelText: AppText.fullName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.emailController,
                    readOnly: controller.isEmail ? true : false,
                    labelText: AppText.emailId,
                    fillColor: controller.isEmail ? AppColor.greyLightColor : null,
                    keyboardType: TextInputType.emailAddress,
                    suffix: controller.isEmail ? GestureDetector(
                      onTap: (){
                        // controller.showPassword();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Image.asset(
                          AssetsPath.doneIcon,
                          height: 25,
                        ),
                      ),
                    ) : Container(),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.mobileNumberController,
                    readOnly: controller.isMobile ? true : false,
                    labelText: AppText.mobileNumber,
                    fillColor: controller.isMobile ? AppColor.greyLightColor : null,
                    keyboardType: TextInputType.number,
                    suffix: controller.isMobile ? GestureDetector(
                      onTap: (){
                        // controller.showPassword();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Image.asset(
                          AssetsPath.doneIcon,
                          height: 25,
                        ),
                      ),
                    ) : Container(),
                  ),
                  const SizedBox(height: 20,),
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
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    AppText.genderWant,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blueColor,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.genderModel.length,
                        crossAxisSpacing: 8, // Adjust as needed
                        mainAxisSpacing: 8, // Adjust as needed
                        mainAxisExtent: 100
                      ),
                      itemCount: controller.genderModel.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final gender = controller.genderModel[index];
                        return GestureDetector(
                          onTap: () {
                            controller.selectGender(index);
                          },
                          child: Card(
                            surfaceTintColor: AppColor.whiteColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: gender.isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,width: 2),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  gender.image,
                                  height: 32,
                                  width: 32,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  gender.name,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: gender.isSelected ? FontWeight.w600 : FontWeight.w400,
                                    color: gender.isSelected ? AppColor.mainTextColor : AppColor.midTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  controller.isLoading ? loader() : GestureDetector(
                    onTap: (){
                      controller.register();
                    },
                    child: commonButton(
                      title: AppText.continueText,
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
