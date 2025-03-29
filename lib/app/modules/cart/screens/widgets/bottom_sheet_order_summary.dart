import 'package:customer_app/app/modules/address/model/address_model.dart';
import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../theme/app_style.dart';

class BottomSheetOrderSummary extends StatelessWidget {
  const BottomSheetOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.orderSummary,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Image.asset(
                          AssetsPath.closeIcon,
                          width: 14,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: AppColor.greyMidBgColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Column(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget addressView(Address address, CartController controller) {
    return Container(
      decoration: BoxDecoration(
        color: address.isSelected ? AppColor.greyLightColor : AppColor.whiteColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColor.greyLightIconColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                controller.selectAddress(address);
              },
              child: Image.asset(
                address.isSelected ? AssetsPath.icRadioButtonSelected : AssetsPath.icRadioButtonDefault,
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.firstname ?? "",
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.mainTextColor,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${address.address1}",
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.midTextColor,
                              ),
                            ),
                            Text(
                              "${address.city} ${address.postcode}",
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.midTextColor,
                              ),
                            ),
                            Text(
                              address.city ?? "",
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.midTextColor,
                              ),
                            ),
                          ],
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
                  const SizedBox(height: 2,),
                  Row(
                    children: [
                      Text(
                        address.telephone ?? "",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 1,
                        color: AppColor.lineDarkBoarderColor,
                        height: 12,
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        address.alternateTelephone ?? "",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
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
                          const SizedBox(width: 10,),
                          Container(
                            width: 1,
                            color: AppColor.lineDarkBoarderColor,
                            height: 12,
                          ),
                          const SizedBox(width: 10,),
                          Row(
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
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.deliverHere(address);
                        },
                        child: Text(
                          AppText.deliverHere,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: address.isDefault == "1" ? AppColor.disableButtonColor : AppColor.easternBlueColor,
                          ),
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
    );
  }

}
