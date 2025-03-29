import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
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
              AppText.allDone,
              style: AppStyle.textStyleOutfit(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColor.mainTextColor,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              AppText.passwordSuccessfully,
              style: AppStyle.textStyleOutfit(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.midTextColor,
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  AssetsPath.success,
                  height: 250,
                ),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: commonButton(
                    title: AppText.backToLogin,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
