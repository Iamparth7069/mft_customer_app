import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/delivery_address_controller.dart';
import '../model/address_model.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity,100),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 1,
                color: Theme.of(Get.context!).primaryColor.withOpacity(.125),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: backButton(),
                    ),
                    const SizedBox(width: 20,),
                    GetBuilder<DeliveryAddressController>(
                      builder: (controller) {
                        return Text(
                          controller.addressList.isEmpty ? AppText.deliveryAddress : AppText.manageDeliveryAddress,
                          style: AppStyle.textStyleOutfit(
                            color: AppColor.mainTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<DeliveryAddressController>(
          init: DeliveryAddressController(),
          builder: (controller) {
            return controller.isLoading ? loader() : controller.addressList.isEmpty ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsPath.threeDViewMap,
                    height: 184,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    AppText.noAddressFound,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppText.youHaveNoAddress,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () async{
                      final result = await Get.toNamed(Routes.ADDADDRESS);
                      print('result $result');
                      if (result == true) {
                        controller.getAddress();
                      }
                    },
                    child: commonButton(title: AppText.addAddress),
                  ),
                ],
              ),
            ) : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: ()async{
                        final result = await Get.toNamed(Routes.ADDADDRESS);
                        print('result $result');
                        if (result == true) {
                          controller.getAddress();
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            AppText.addNewAddress,
                            textAlign: TextAlign.center,
                            style: AppStyle.textStyleOutfit(
                              color: AppColor.easternBlueColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Image.asset(
                            AssetsPath.chevronRight,
                            height: 16,
                            width: 16,
                            color: AppColor.easternTextBlueColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    heading(title: AppText.defaultAddress, isShow: false),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.addressList.length,
                      itemBuilder: (context,index){
                        Address address = controller.addressList[index];
                        if (address.isDefault == "0") {
                          return const SizedBox.shrink();
                        }
                        return addressView(address,controller);
                      },
                    ),
                    const SizedBox(height: 20,),
                    heading(title: AppText.otherAddress, isShow: false),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.addressList.length,
                      itemBuilder: (context,index){
                        Address address = controller.addressList[index];
                        if (address.isDefault == "1") {
                          return const SizedBox.shrink();
                        }
                        return addressView(address,controller);
                      },
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  addressView(Address address, DeliveryAddressController controller){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.greyLightColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColor.greyLightIconColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      address.firstname ?? "",
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
                        address.addressType ?? "",
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
                address.address1 ?? "",
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
              ),
              Text(
                "${address.city ?? ""} ${address.postcode ?? ""}",
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
              ),
              Text(
                address.salutation ?? "",
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
              ),
              const SizedBox(height: 2,),
              Row(
                children: [
                  Text(
                    address.telephone ?? "",
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  address.alternateTelephone!.isEmpty ? Container() :Container(
                    width: 1,
                    color: AppColor.lineDarkBoarderColor,
                    height: 12,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    address.alternateTelephone ?? "",
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  GestureDetector(
                    onTap: ()async{
                      final result = await Get.toNamed(Routes.EDITADDRESS, arguments: address);
                      print('result $result');
                      if (result == true) {
                        controller.getAddress();
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsPath.icEdit,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8,),
                        Text(
                          AppText.edit,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.easternBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 1,
                    color: AppColor.lineDarkBoarderColor,
                    height: 12,
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      controller.deleteAddress(address.addressId);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsPath.icTrash,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8,),
                        Text(
                          AppText.delete,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
