import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/app/modules/cart/screens/widgets/select_drop_down_list.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../theme/app_style.dart';
import '../../product_detail/screens/custom_switch.dart';

class StepTreeScreen extends StatelessWidget {
  const StepTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.addSpecialNote,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.selectOccasion,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                SizedBox(
                  height: 36,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: controller.occasionModelList.length,
                    itemBuilder: (context,index){
                      bool isLastItem = index == controller.occasionModelList.length - 1;
            
                      return Padding(
                        padding: EdgeInsets.only(left: 16,right: isLastItem ? 16 : 0),
                        child: GestureDetector(
                          onTap: (){
                            controller.selectOccasion(controller.occasionModelList[index]);
                          },
                          child: Container(
                            height: 36,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: controller.occasionModelList[index].isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: Text(
                                  controller.occasionModelList[index].name,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: controller.occasionModelList[index].isSelected ? FontWeight.w600 : FontWeight.w400,
                                    color: controller.occasionModelList[index].isSelected ? AppColor.mainTextColor : AppColor.midTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppColor.dividerColor,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.midTextColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColor.dividerColor,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                SelectDropList(
                  itemSelected: controller.optionItemSelected,
                  dropListModel: controller.dropListModel,
                  showIcon: false,     // Show Icon in DropDown Title
                  showArrowIcon: true,     // Show Arrow Icon in DropDown
                  showBorder: true,
                  borderRadius: BorderRadius.circular(4),
                  borderColor: AppColor.lineDarkBoarderColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  onOptionSelected:(optionItem){
                    controller.onOptionSelected(optionItem);
                  },
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: controller.messageController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    maxLength: 250,
                    minLines: 3,
                    maxLines: null,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: AppColor.whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      hintText: AppText.enterYourMessage,
                      hintStyle: AppStyle.textStyleOutfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: controller.senderNameController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: AppColor.whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                      ),
                      hintText: AppText.senderName,
                      hintStyle: AppStyle.textStyleOutfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.hideSenderName,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      CustomSwitch(
                        value: controller.isHideSenderName,
                        onChanged: (bool val){
                          controller.hideSenderName();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          );
        }
      ),
    );
  }
}
