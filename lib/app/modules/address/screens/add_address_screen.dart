import 'package:customer_app/app/modules/address/controller/add_address_controller.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../constants/custom_text_field.dart';
import '../../../../theme/app_style.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.addAddress),
      body: GetBuilder<AddAddressController>(
        init: AddAddressController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  heading(title: AppText.contactInformation, isShow: false),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.fullNameController,
                    labelText: AppText.fullName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.mobileNumberController,
                    labelText: AppText.mobileNumber,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.alternateMobileNumberController,
                    labelText: AppText.alternateMobileNumber,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20,),
                  heading(title: AppText.shippingAddress, isShow: false),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.pinCodeController,
                    labelText: AppText.pinCode,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    onChanged: (value) {
                      if (value.length == 6) { // Assuming pin code is 6 digits
                        controller.fetchPinCodeDetails(value);
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.cityController,
                    labelText: AppText.city,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.stateController,
                    labelText: AppText.state,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldWidget(
                    controller: controller.addressLineController1,
                    labelText: AppText.addressLine1,
                  ),
                  // const SizedBox(height: 20,),
                  // CustomTextFieldWidget(
                  //   controller: controller.addressLineController2,
                  //   labelText: AppText.addressLine2,
                  // ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.isChecked();
                        },
                        child: Image.asset(
                          controller.isCheck ? AssetsPath.icCheckboxSelected : AssetsPath.icCheckboxUnselect,
                          height: 20,
                          width: 20,
                          color: AppColor.greyLightIconColor,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        AppText.makeThisAsDefaultAddress,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  heading(title: AppText.addressType, isShow: false),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.addressType.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                              controller.selectAddressType(index);
                            },
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.mainTextColor.withOpacity(0.15),
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: controller.addressType[index].isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  controller.addressType[index].name,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: controller.addressType[index].isSelected ? FontWeight.w600 : FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: GetBuilder<AddAddressController>(
        builder: (controller) {
          return Container(
            height: 72,
            width: Get.width,
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
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 11),
              child: controller.isLoaded ? loader() : GestureDetector(
                onTap: (){
                  controller.addAddress();
                },
                child: commonButton(title: AppText.saveAddress),
              ),
            ),
          );
        },
      ),
    );
  }
}
