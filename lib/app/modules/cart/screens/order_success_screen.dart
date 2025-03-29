import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity,75),
        child: Container(
          height: 75,
          color: AppColor.whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: backButton(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    AssetsPath.successOrder,
                    height: 183,
                    width: 260,
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.yourOrderSuccessful,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.thanksYourPurchase,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 164,
                  color: AppColor.pinkColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        orderDetail(AppText.orderId,"#9866776"),
                        orderDetail(AppText.transactionType,"Net banking"),
                        orderDetail(AppText.transactionId,"123242455"),
                        orderDetail(AppText.expectedDelivery,"10 Jun 2024"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, // Make the divider transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
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
                      child: ExpansionTile(
                        iconColor: AppColor.easternBlueColor,
                        collapsedIconColor: AppColor.easternBlueColor,
                        childrenPadding: EdgeInsets.zero,
                        initiallyExpanded: true,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: Text(
                          AppText.shippingDetails,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.addressModel.fullName,
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
                                    "${controller.addressModel.address1} ${controller.addressModel.address2 ?? ""}",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  Text(
                                    "${controller.addressModel.city} ${controller.addressModel.pinCode}",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  Text(
                                    controller.addressModel.state,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Text(
                                    controller.addressModel.mobile,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: Container(
        height: 72,
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.ORDERTRACK1);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColor.mainTextColor),
                        ),
                        child: Center(
                          child: Text(
                            AppText.trackMyOrder,
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
                        Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.mainTextColor,
                        ),
                        child: Center(
                          child: Text(
                            AppText.continueShopping,
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
            ],
          ),
        ),
      ),
    );
  }

  orderDetail(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.textStyleOutfit(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.mainTextColor,
          ),
        ),
        Text(
          data,
          style: AppStyle.textStyleOutfit(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.mainTextColor,
          ),
        ),
      ],
    );
  }
}
