import 'package:customer_app/app/modules/order_page/screen/widget/bottom_sheet_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import '../controller/order_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.myOrders),
      body: GetBuilder<OrderController>(
        init: OrderController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Container(
                    color: AppColor.greyLightColor,
                    child: Row(
                      children: [
                        searchBar(true),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColor.dividerColor,
                                    width: 1,
                                  ),
                                  color: AppColor.whiteColor,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AssetsPath.icFilterLines,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -2,
                              bottom: 35,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: AppColor.illusionTextColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "2",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColor.dividerColor,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: controller.orderData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.ORDERTRACK,arguments: {
                          "OrderId": controller.orderData[index].orderId
                        });
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.orderData[index].status,
                                      style: AppStyle.textStyleOutfit(
                                        color: AppColor.errorColor,
                                        // color: Color(controller.cartData[index].color),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      controller.orderData[index].date.isEmpty ? "On 05 May 2024" : controller.orderData[index].date,
                                      style: AppStyle.textStyleOutfit(
                                        color: AppColor.midTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "ID :${controller.orderData[index].orderId}",
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.mainTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: SizedBox(
                                    height: 52,
                                    width: 52,
                                    child: Image.network(
                                      controller.orderData[index].image,
                                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                        return const SizedBox(
                                          height: 52,
                                          width: 52,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.orderData[index].productName,
                                              style: AppStyle.textStyleOutfit(
                                                color: AppColor.mainTextColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Image.asset(
                                              AssetsPath.chevronRight,
                                              height: 24,
                                              width: 24,
                                              color: AppColor.easternTextBlueColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5,),
                                        Text.rich(
                                          textAlign: TextAlign.start,
                                          TextSpan(
                                            text: controller.orderData[index].price,
                                            style: AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.orderData[index].price,
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppText.rateThisProductNow,
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.midTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.addReview();
                                  },
                                  child: RatingBarIndicator(
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
                                ),
                              ],
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
        },
      ),
    );
  }

  Widget searchBar(bool isShowBoarder) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(Routes.SEARCHPRODUCT);
      },
      child: SizedBox(
        height: 48,
        width: Get.width - 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isShowBoarder
                  ? Border.all(
                color: AppColor.dividerColor,
                width: 1,
              )
                  : null,
              color: AppColor.whiteColor,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  AssetsPath.searchIcon,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  AppText.searchYourOrder,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyLightIconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      const BottomSheetOrderFilter(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }
}
