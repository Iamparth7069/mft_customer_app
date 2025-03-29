import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';

class StepFourScreen extends StatelessWidget {
  const StepFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 72,
                  color: AppColor.greyLightColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
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
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.deliveryDateAndTime,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            getAssetPath(controller.selectedSlotName),
                            height: 24,
                            width: 24,
                            color: AppColor.easternBlueColor,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            controller.selectedSlotName,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.midTextColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.selectedSlotTime,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.spacialNote,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
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
                              controller.isOccasionSelected == true ? controller.occasionString : controller.optionItemSelected.title,
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
                            width: 100,
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
                              controller.messageController.text,
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
                            width: 100,
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
                              controller.senderNameController.text,
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
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.mftWallet,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightBlueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AssetsPath.wallet,
                                    height: 32,
                                    width: 32,
                                  ),
                                  const SizedBox(width: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppText.mftWalletBalance,
                                        style: AppStyle.textStyleOutfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.mainTextColor,
                                        ),
                                      ),
                                      Text(
                                        "₹500",
                                        style: AppStyle.textStyleOutfit(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.mainTextColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  controller.isCheckedWallet();
                                },
                                child: Image.asset(
                                  controller.isCheckWallet ? AssetsPath.icCheckboxSelected : AssetsPath.icCheckboxUnselect,
                                  height: 22,
                                  width: 22,
                                  color: !controller.isCheckWallet ? AppColor.mainTextColor : AppColor.easternBlueColor,
                                ),
                              ),
                            ],
                          ),
                          controller.isCheckWallet ? Column(
                            children: [
                              const SizedBox(height: 10,),
                              TextFormField(
                                controller: controller.amountController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                onTap: (){
                                  controller.showPrice();
                                },
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
                                  hintText: AppText.enterAmount,
                                  hintStyle: AppStyle.textStyleOutfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.midTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ) : Container(),
                          const SizedBox(height: 5,),
                          const Divider(
                            color: AppColor.dividerColor,
                          ),
                          const SizedBox(height: 5,),
                          controller.isShowPrice ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppText.totalAmountPayable,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    GestureDetector(
                                      onTap: (){
                                        controller.orderSummary();
                                      },
                                      child: Image.asset(
                                        AssetsPath.icInfoCircle,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₹400",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ],
                            )
                            : Text(
                            AppText.useAvailableMft,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.successColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String getAssetPath(String condition) {
    if (condition == 'Morning delivery') {
      return AssetsPath.icMorning;
    } else if (condition == 'Express delivery') {
      return AssetsPath.icDelivery;
    } else if (condition == 'Standard delivery') {
      return AssetsPath.icStander;
    } else if (condition == 'Fixed time') {
      return AssetsPath.icSameDay;
    } else if (condition == 'Midnight delivery') {
      return AssetsPath.icNight;
    } else {
      return AssetsPath.icDelivery;
    }
  }

}
