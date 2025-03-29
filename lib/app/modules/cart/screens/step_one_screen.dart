import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';
import '../../product_detail/screens/dashed_rect.dart';
import '../model/cart_data.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return controller.isLoading ? loader() : controller.cartProduct?.result?.products
              ?.isEmpty ?? true ?
          Center(
            child: Text(
              "Your Cart is empty",
              style: AppStyle.textStyleOutfit(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.mainTextColor,
              ),
            ),
          ) : SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 72,
                      color: AppColor.greyLightColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: controller.firstName == null ? GestureDetector(
                          onTap: (){
                            controller.changeAddress();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              commonButtonWithBoarder(title: AppText.addAddress),
                            ],
                          ),
                        ) : Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    TextSpan(
                                      text: AppText.earliestDelivery,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${controller.firstName},${controller.postCode}",
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.mainTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    "${controller.address}",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15,),
                            GestureDetector(
                              onTap: (){
                                controller.changeAddress();
                              },
                              child: Text(
                                AppText.change,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.easternBlueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.cartProduct?.result?.products
                          ?.isEmpty ?? true
                          ? 0 // or any default value or length
                          : controller.cartProduct!.result!.products!.length,
                      itemBuilder: (context, index) {
                        Products? product = controller.cartProduct?.result
                            ?.products?[index];
                        return cartDataView(product, controller);
                      },
                    ),
                    !controller.isDiscountAdded ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      child: GestureDetector(
                        onTap: (){
                          controller.applyCoupon();
                        },
                        child: Container(
                          height: 46,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColor.pinkColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetsPath.coupon,
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 15,),
                                    Text(
                                      AppText.applyCoupon,
                                      style: AppStyle.textStyleOutfit(
                                        color: AppColor.mainTextColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  AssetsPath.chevronRight,
                                  height: 20,
                                  width: 20,
                                  color: AppColor.easternTextBlueColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ) :
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.successColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.chipGreenColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 3),
                                            child: Image.asset(
                                              AssetsPath.icDiscount,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            "CH100",
                                            style: AppStyle.textStyleOutfit(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.midTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Positioned.fill(
                                      child: DashedRect(color: AppColor.successColor, strokeWidth: 1.0, gap: 3.0,),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: Text(
                                  "Saved ₹100",
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.mainTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  controller.removeCoupon();
                                },
                                child: Text(
                                  AppText.remove,
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.errorColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.pinkColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.cartProduct == null ? "Price details" : "Price details (${controller.cartProduct!.result!
                              .products!.isEmpty ? 0 : controller.cartProduct
                              ?.result?.products?.length} item)",
                          style: AppStyle.textStyleOutfit(
                            color: AppColor.mainTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12,),
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
                              controller.subTotal,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppText.couponDiscount,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                // Get.toNamed(Routes.COUPON);
                              },
                              child: Text(
                                controller.cartProduct?.result == null
                                    ? "--"
                                    : controller.isDiscountAdded
                                    ? controller.couponDiscount : "--",
                                style: AppStyle.textStyleOutfit(
                                  color: AppColor.mainTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
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
                                controller.redeem();
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
                        const SizedBox(height: 5,),
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
                              controller.total,
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget cartDataView(Products? product, CartController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              product!.image!,
              height: 88,
              width: 88,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const SizedBox(
                  height: 88,
                  width: 88,
                );
              },
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "",
                  style: AppStyle.textStyleOutfit(
                    color: AppColor.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Text(
                            product.price ?? "",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          // Text(
                          //   product.addon!.isEmpty ? product.price ?? "" : product.addon ?? "",
                          //   style: AppStyle.textStyleOutfit(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //     color: AppColor.midTextColor,
                          //     textDecoration: TextDecoration.lineThrough,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 55,
                      decoration: BoxDecoration(
                        color: AppColor.greenColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 2,),
                          Image.asset(
                            AssetsPath.star,
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 3,),
                          Text(
                            product.rating ?? "",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 2,),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                  width: 90,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColor.dividerColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.increaseQuantity(product);
                        },
                        child: SizedBox(
                          width: 28,
                          child: Image.asset(
                            AssetsPath.plusCircle,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 1,
                              height: 28,
                              color: AppColor.dividerColor,
                            ),
                            Text(
                              product.quantity.toString(),
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 28,
                              color: AppColor.dividerColor,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.decreaseQuantity(product);
                        },
                        child: SizedBox(
                          width: 28,
                          child: Image.asset(
                            AssetsPath.minusCircle,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              controller.deleteProduct(product);
            },
            child: Image.asset(
              AssetsPath.icDelete,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
