import 'dart:io';

import 'package:customer_app/constants/assets_path.dart';
import 'package:customer_app/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../routes/app_pages.dart';
import '../../cart/screens/widgets/select_drop_down_list.dart';
import '../../product_detail/screens/dashed_rect.dart';
import '../controller/help_center_controller.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.helpCenter,
      ),
      body: GetBuilder<HelpCenterController>(
        init: HelpCenterController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        AppColor.pinkColor1.withOpacity(0.5),
                        AppColor.pinkColor1.withOpacity(0.01),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppText.hadIssue,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                AppText.wePromise,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          AssetsPath.helpCenter,
                          height: 139,
                          width: 123,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                SelectDropList(
                  itemSelected: controller.optionOrderIDSelected,
                  dropListModel: controller.dropListOrderListModel,
                  showIcon: false,
                  showArrowIcon: true,
                  showBorder: true,
                  borderRadius: BorderRadius.circular(4),
                  borderColor: AppColor.lineDarkBoarderColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  containerPadding: const EdgeInsets.only(right: 8),
                  onOptionSelected:(optionItem){
                    controller.optionOrderIdSelected(optionItem);
                  },
                ),
                const SizedBox(height: 12,),
                SelectDropList(
                  itemSelected: controller.optionProductSelected,
                  dropListModel: controller.productListModel,
                  showIcon: false,
                  showArrowIcon: true,
                  showBorder: true,
                  borderRadius: BorderRadius.circular(4),
                  borderColor: AppColor.lineDarkBoarderColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  containerPadding: const EdgeInsets.only(right: 8),
                  onOptionSelected:(optionItem){
                    controller.optionProductSelect(optionItem);
                  },
                ),
                const SizedBox(height: 12,),
                SelectDropList(
                  itemSelected: controller.optionComplaintSelected,
                  dropListModel: controller.complaintListModel,
                  showIcon: false,
                  showArrowIcon: true,
                  showBorder: true,
                  borderRadius: BorderRadius.circular(4),
                  borderColor: AppColor.lineDarkBoarderColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  containerPadding: const EdgeInsets.only(right: 8),
                  onOptionSelected:(optionItem){
                    controller.optionComplaintSelect(optionItem);
                  },
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: controller.noteController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    minLines: 3,
                    maxLines: 3,
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
                      hintText: AppText.note,
                      hintStyle: AppStyle.textStyleOutfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: heading(title: AppText.uploadImage, isShow: false),
                ),
                const SizedBox(height: 12,),
                GestureDetector(
                  onTap: (){
                    controller.selectFile();
                  },
                  child: Container(
                    height: 66,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColor.lightBlueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 58,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const DashedRect(color: AppColor.blueBgColor, strokeWidth: 1.0, gap: 5.0,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  AssetsPath.icUpload,
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppText.chooseImage,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.easternBlueColor,
                                      ),
                                    ),
                                    Text(
                                      AppText.max8Mb,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.midTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                controller.platformFile == null ? Container() : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 70,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: controller.platformFile == null ? Container() : Image.file(
                            File(controller.platformFile!.path!),
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                              return const SizedBox(
                                height: 70,
                                width: 70,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  controller.removeFile();
                                },
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AssetsPath.closeIcon,
                                      height: 8,
                                      width: 20,
                                      color: AppColor.easternBlueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<HelpCenterController>(
        builder: (controller) {
          return Container(
            height: 72,
            color: AppColor.whiteColor,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.mainTextColor.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, -4), // changes position of shadow to top
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(controller.platformFile != null){
                          Get.toNamed(Routes.COMPLAINTSUCCESS);
                        }
                      },
                      child: commonButton(
                        title: AppText.submit,
                        color: controller.platformFile == null ? AppColor.disableButtonColor : AppColor.mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
