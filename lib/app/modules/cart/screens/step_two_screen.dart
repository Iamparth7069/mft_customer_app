import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../model/date_time_model.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.firstName ?? "",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.pinkColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.addressModel.addressType,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${controller.address}",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.midTextColor,
                            ),
                          ),
                          Text(
                            "${controller.city} ${controller.postCode}",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.midTextColor,
                            ),
                          ),
                          Text(
                            controller.city ?? "",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.midTextColor,
                            ),
                          ),
                          const SizedBox(height: 2,),
                          Text(
                            controller.telephone ?? "",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: (){
                          controller.changeAddress();
                        },
                        child: commonButtonWithBoarder(title: AppText.changeOrAddAddress),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(
                      color: AppColor.dividerColor,
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: heading(title: AppText.deliveryDateAndTime, isShow: false),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: dateContainer(
                              date: controller.formatDate(controller.today),
                              formattedDate: "Today",
                              controller: controller,
                              isSelected: controller.selectedDate == "Today",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: dateContainer(
                              date: controller.formatDate(controller.tomorrow),
                              formattedDate: "Tomorrow",
                              controller: controller,
                              isSelected: controller.selectedDate == "Tomorrow",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: dateContainer(
                              date: "Customs",
                              formattedDate: "Later",
                              controller: controller,
                              isSelected: controller.selectedDate == "Later",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
                SizedBox(
                  height: 340,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 164,
                        color: AppColor.darkLightColor,
                        height: double.infinity,
                        child: ListView.builder(
                          itemCount: controller.dateTimeModelList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                controller.selectDateTime(index);
                              },
                              child: Container(
                                height: 68,
                                color: controller.dateTimeModelList[index].isSelected ? AppColor.pinkBgColor : AppColor.darkLightColor,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 68,
                                      color: controller.dateTimeModelList[index].isSelected ? AppColor.easternTextBlueColor : AppColor.lightBlueColor,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              controller.dateTimeModelList[index].image,
                                              height: 24,
                                              width: 24,
                                            ),
                                            const SizedBox(width: 10,),
                                            Expanded(
                                              child: Text(
                                                controller.dateTimeModelList[index].name,
                                                style: AppStyle.textStyleOutfit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.mainTextColor,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.dateTimeModelList[index].price,
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.dateTimeModelList[controller.categorySelectedIndex].subTime.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context,index){
                            TimeModel subFilter = controller.dateTimeModelList[controller.categorySelectedIndex].subTime[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      controller.isChecked(subFilter);
                                    },
                                    child: Image.asset(
                                      subFilter.isSelected ? AssetsPath.icRadioButtonSelected : AssetsPath.icRadioButtonDefault,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget dateContainer({required String date, required String formattedDate,required CartController controller,required bool isSelected}) {
    return GestureDetector(
      onTap: (){
        controller.selectDate(formattedDate);
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,
            width: 2,
          ),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
              color: AppColor.mainTextColor.withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedDate,
              style: AppStyle.textStyleOutfit(
                color: AppColor.mainTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Text(
              date.toString(),
              style: AppStyle.textStyleOutfit(
                color: AppColor.midTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
