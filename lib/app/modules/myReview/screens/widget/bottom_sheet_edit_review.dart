import 'package:customer_app/app/modules/address/model/address_model.dart';
import 'package:customer_app/app/modules/cart/controller/cart_controller.dart';
import 'package:customer_app/app/modules/myReview/controller/my_review_controller.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/common_widget.dart';
import '../../../../../theme/app_style.dart';

// ignore: must_be_immutable
class BottomSheetEditReview extends StatelessWidget {
  double ratting;
  String title;
  BottomSheetEditReview({required this.ratting,required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyReviewController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          AppText.editReview,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
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
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.howWouldRate,
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
                      RatingBar.builder(
                        initialRating: ratting,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemBuilder: (context, ind) {
                          bool isSelected = ind < ratting;
                          return Image.asset(
                            isSelected ? AssetsPath.icStarFill : AssetsPath.icStar,
                            height: 16,
                            width: 20,
                          );
                        },
                        onRatingUpdate: (rating) {
                          ratting = rating;
                          controller.update();
                          // setState(() {
                          //   _currentRating = rating;
                          // });
                        },
                      ),
                      Text(
                        controller.getTextRatting(ratting),
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: controller.writeReviewController,
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
                      hintText: AppText.writeAReview,
                      hintStyle: AppStyle.textStyleOutfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                Container(
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: commonButton(title: AppText.submit),
                        ),
                      ],
                    ),
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
                              "${address.city} ${address.postcode ?? ""}",
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
                            color: address.isDefault == "1"? AppColor.disableButtonColor : AppColor.easternBlueColor,
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
