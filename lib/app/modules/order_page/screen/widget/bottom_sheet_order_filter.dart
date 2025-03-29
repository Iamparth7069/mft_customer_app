import 'package:customer_app/app/modules/product/model/filter_model.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../theme/app_style.dart';
import '../../controller/order_controller.dart';

class BottomSheetOrderFilter extends StatelessWidget {
  const BottomSheetOrderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return SizedBox(
          width: Get.width,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.filter,
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
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      color: AppColor.lightBlueColor,
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: controller.filterModelList.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              controller.selectFilter(index);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 48,
                                  color: controller.filterModelList[index].isSelected ? AppColor.easternTextBlueColor : AppColor.lightBlueColor,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller.filterModelList[index].name,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.filterModelList[controller.categorySelectedIndex].subFilter.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context,index){
                          SubFilter subFilter = controller.filterModelList[controller.categorySelectedIndex].subFilter[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.isChecked(subFilter);
                                  },
                                  child: Image.asset(
                                    subFilter.isSelected ? AssetsPath.icCheckboxSelected : AssetsPath.icCheckboxUnselect,
                                    height: 20,
                                    width: 20,
                                    color: subFilter.isSelected ? AppColor.easternBlueColor : AppColor.greyLightIconColor,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  subFilter.name,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColor.mainTextColor),
                            ),
                            child: Center(
                              child: Text(
                                AppText.cancel,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColor.mainTextColor,
                            ),
                            child: Center(
                              child: Text(
                                AppText.apply,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
