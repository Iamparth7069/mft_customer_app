import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../order_tracking/screens/widget/custom_steps.dart';
import '../controller/order_tracking1_controller.dart';

class OrderTracking1 extends StatelessWidget {
  const OrderTracking1({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked : (didPop){
        Future.delayed(const Duration(milliseconds: 200), () {
          Get.offAllNamed(Routes.DASHBOARD,arguments: 3);
        });
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.DASHBOARD,arguments: 3);
                      },
                      child: backButton(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    AppText.trackingOrder1,
                    style: AppStyle.textStyleOutfit(
                      color: AppColor.mainTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GetBuilder<OrderTracking1Controller>(
          init: OrderTracking1Controller(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                      color: AppColor.greyLightColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13,),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.searchController,
                              textInputAction: TextInputAction.search,
                              cursorColor: AppColor.mainTextColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Order ID is required';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                // controller.validateForm();
                              },
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: AppColor.whiteColor,
                                // contentPadding: const EdgeInsets.only(left: 16,top: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: AppColor.lineDarkBoarderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: AppColor.lineDarkBoarderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: AppColor.lineDarkBoarderColor),
                                ),
                                hintText: AppText.enterYourOrderID,
                                hintStyle: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(
                                    AssetsPath.searchIcon,
                                    height: 16,
                                    width: 16,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                                suffixIcon: controller.isTextNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        controller.clear();
                                      },
                                    )
                                  : null,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: controller.emailController,
                              textInputAction: TextInputAction.search,
                              cursorColor: AppColor.mainTextColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email ID is required';
                                }
                                // Basic email validation
                                final emailRegex =
                                    RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                // controller.validateForm();
                              },
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: AppColor.whiteColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: AppColor.lineDarkBoarderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: AppColor.lineDarkBoarderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                                ),
                                hintText: "Enter email ID",
                                hintStyle: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () async{
                                if(controller.formKey.currentState!.validate()){
                                  await controller.getData();
                                  controller.showData();
                                }
                              },
                              child: commonButton(
                                title: AppText.trackMyOrder,
                                color: !controller.showContent
                                    ? AppColor.disableButtonColor
                                    : AppColor.mainTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    controller.showContent == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text(
                                    AppText.trackingOrder,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                  Text(
                                    " #${controller.orderDetails!.result.orderId}",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Status: Delivered",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.successColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomSteps(orderTracking1Controller: controller,),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              color: AppColor.yellowLightColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Text(
                                      "Rate this product now",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBarIndicator(
                                          rating: controller.userRating,
                                          itemBuilder: (context, index) {
                                            bool isSelected =
                                                index < controller.userRating;
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Image.asset(
                                                isSelected
                                                    ? AssetsPath.icStarFill
                                                    : AssetsPath.icStar,
                                              ),
                                            );
                                          },
                                          itemCount: 5,
                                          itemSize: 24.0,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          "Tell us more",
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.easternBlueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Spacial note",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              "Occasion",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.midTextColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Birthday",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              "Message",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.midTextColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              "Sender name",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.midTextColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "John doe",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors
                                    .transparent, // Make the divider transparent
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColor.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        color: AppColor.mainTextColor
                                            .withOpacity(0.15),
                                      ),
                                    ],
                                  ),
                                  child: ExpansionTile(
                                    iconColor: AppColor.easternBlueColor,
                                    collapsedIconColor:
                                        AppColor.easternBlueColor,
                                    childrenPadding: EdgeInsets.zero,
                                    initiallyExpanded: true,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    title: Text(
                                      "Shipping details",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "John doe",
                                                      style: AppStyle
                                                          .textStyleOutfit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .mainTextColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(20),
                                                      color:
                                                          AppColor.pinkColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                      child: Text(
                                                        "Home",
                                                        style: AppStyle
                                                            .textStyleOutfit(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor
                                                              .mainTextColor,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "401, Marutidham society, Opp. PVR Cinema, Katargam",
                                                style:
                                                    AppStyle.textStyleOutfit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColor.midTextColor,
                                                ),
                                              ),
                                              Text(
                                                "Surat 395601",
                                                style:
                                                    AppStyle.textStyleOutfit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColor.midTextColor,
                                                ),
                                              ),
                                              Text(
                                                "Gujarat",
                                                style:
                                                    AppStyle.textStyleOutfit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColor.midTextColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                "+91 88888 774474",
                                                style:
                                                    AppStyle.textStyleOutfit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColor.mainTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order summary",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total price",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "₹510",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            textAlign: TextAlign.start,
                                            TextSpan(
                                              text: "Coupon discount ",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.mainTextColor,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "(CH100)",
                                                  style: AppStyle
                                                      .textStyleOutfit(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    color: AppColor
                                                        .mainTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Get.toNamed(Routes.COUPON);
                                            },
                                            child: Text(
                                              "₹100",
                                              style: AppStyle.textStyleOutfit(
                                                color: AppColor.mainTextColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Reward point",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              "Redeem",
                                              style: AppStyle.textStyleOutfit(
                                                color:
                                                    AppColor.easternBlueColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Delivery charge",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "--",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        color: AppColor.dividerColor,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total amount",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "₹410",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        color: AppColor.dividerColor,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "MFT wallet",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "₹10",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "To pay",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "₹400",
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Container()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
