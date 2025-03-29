import 'package:customer_app/app/modules/same_day_delivery/controller/same_day_delivery_controller.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../theme/app_style.dart';

class BottomSheetSortSameDayDelivery extends StatelessWidget {
  const BottomSheetSortSameDayDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SameDayDeliveryController>(builder: (controller) {
      return SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.sortBy,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  Image.asset(
                    AssetsPath.closeIcon,
                    width: 14,
                    height: 18,
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 1,
              color: AppColor.greyMidBgColor,
            ),
            ListView.builder(
              itemCount: controller.sortModelList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: GestureDetector(
                    onTap: (){
                      controller.sortProduct(controller.sortModelList[index].subName);
                    },
                    child: Text(
                      controller.sortModelList[index].name,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.mainTextColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
