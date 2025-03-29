import 'package:customer_app/app/modules/product/controller/product_list_controller.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../theme/app_style.dart';

class BottomSheetSort extends StatelessWidget {
  const BottomSheetSort({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
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
                      controller.setSelectedSortIndex(index);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedSortIndex == index ? AssetsPath.icRadioButtonSelected : AssetsPath.icRadioButtonDefault,
                          height: 20,
                          width: 20,
                          color: controller.selectedSortIndex == index ? AppColor.easternBlueColor : AppColor.greyLightIconColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          controller.sortModelList[index].name,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                      ],
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
