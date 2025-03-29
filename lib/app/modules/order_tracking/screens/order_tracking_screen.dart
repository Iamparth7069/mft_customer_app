import 'package:customer_app/app/modules/order_tracking/screens/widget/custom_steps.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/order_tracking_controller.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.orders,
        trailing: Text(
          "ID: #9866776",
          style: AppStyle.textStyleOutfit(
            color: const Color(0xff2A343E),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: GetBuilder<OrderTrackingController>(
        init: OrderTrackingController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xffF4F7FA),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
                                height: 69,
                                width: 67,
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  return const SizedBox(
                                    height: 69,
                                    width: 67,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Coffee chocochip cake",
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.mainTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                    text: "₹510 ",
                                    style: AppStyle.textStyleOutfit(
                                      color: AppColor.mainTextColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "₹600",
                                        style: AppStyle.textStyleOutfit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.midTextColor,
                                          textDecoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 12,),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.mainTextColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppText.reorder,
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
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: AppColor.mainTextColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppText.invoice,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        " #9866776",
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: CustomSteps(),
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
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          AppText.rateThisProductNow,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBarIndicator(
                              rating: controller.userRating,
                              itemBuilder: (context, index) {
                                bool isSelected = index < controller.userRating;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Image.asset(
                                    isSelected ? AssetsPath.icStarFill : AssetsPath.icStar,
                                  ),
                                );
                              },
                              itemCount: 5,
                              itemSize: 24.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              AppText.tellUsMore,
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.spacialNote,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  AppText.occasion,
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
                          const SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  AppText.message,
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
                          const SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  AppText.senderName,
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
                    dividerColor: Colors.transparent, // Make the divider transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                          "John doe",
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
                                            "Home",
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
                                    "401, Marutidham society, Opp. PVR Cinema, Katargam",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Surat 395601",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Gujarat",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Text(
                                    "+91 88888 774474",
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
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.orderSummary,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.totalPrice,
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
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  text: AppText.couponDiscount,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "(CH100)",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
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
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.rewardPoint,
                                style: AppStyle.textStyleOutfit(
                                  color: AppColor.mainTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                },
                                child: Text(
                                  AppText.redeem,
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.easternBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.deliveryCharge,
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
                          const SizedBox(height: 5,),
                          const Divider(
                            color: AppColor.dividerColor,
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.totalAmount,
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
                          const SizedBox(height: 5,),
                          const Divider(
                            color: AppColor.dividerColor,
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.mftWallet,
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
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppText.toPay,
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
                const SizedBox(height: 20,),
              ],
            ),
          );
        },
      ),
    );
  }
}
