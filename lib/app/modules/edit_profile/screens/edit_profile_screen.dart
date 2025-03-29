import 'package:customer_app/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.editProfile),
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  CustomTextFieldWidget(
                    controller: controller.fullNameController,
                    labelText: AppText.fullName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.emailController,
                    readOnly: false,
                    labelText: AppText.emailId,
                    keyboardType: TextInputType.emailAddress,
                    suffix: GestureDetector(
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
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.mobileNumberController,
                    readOnly: false,
                    labelText: AppText.mobileNumber,
                    keyboardType: TextInputType.number,
                    suffix: GestureDetector(
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
                    ),
                  ),
                  const SizedBox(height: 32,),
                  commonButton(
                    title: AppText.saveChanges,
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
