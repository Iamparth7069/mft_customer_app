import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        leading: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
         child: GestureDetector(
           onTap: () {
             Get.back();
           },
           child: Row(
             children: [
               backButton(),
             ],
           ),
         ),
       ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.success,
              height: 160,
            ),
            Text(
              AppText.congratulations,
              style: AppStyle.textStyleOutfit(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.mainTextColor,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: AppColor.pinkColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹500",
                    style: AppStyle.textStyleOutfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  Text(
                    AppText.addedYourWallet,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppText.purchaseYourGift,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
