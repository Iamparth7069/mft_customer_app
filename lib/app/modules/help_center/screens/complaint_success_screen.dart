import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class ComplaintSuccessScreen extends StatelessWidget {
  const ComplaintSuccessScreen({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsPath.successOrder,
            height: 183,
            width: 260,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppText.yourComplaintSuccess,
              style: AppStyle.textStyleOutfit(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.mainTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppText.yourComplaintSuccessSubText,
              style: AppStyle.textStyleOutfit(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.midTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            height: 92,
            width: double.infinity,
            color: AppColor.pinkColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.complaintNumber,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      Text(
                        "#CN1234445433",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.orderId,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      Text(
                        "#9866776",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}
