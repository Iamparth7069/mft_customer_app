import 'package:customer_app/app/modules/coupon/controller/coupon_controller.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../product_detail/screens/dashed_rect.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.coupon),
      body: GetBuilder<CouponController>(
        init: CouponController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: 80,
                color: AppColor.greyLightColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: controller.couponController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: AppColor.whiteColor,
                        contentPadding: const EdgeInsets.only(left: 16,top: 15),
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
                        hintText: AppText.enterCouponCode,
                        hintStyle: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                          },
                          child: SizedBox(
                            width: 55,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Row(
                                children: [
                                  Text(
                                    AppText.check,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.easternBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.couponList.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 136,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AssetsPath.subtract,
                          ),
                          fit: BoxFit.fill
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              controller.couponList[index].name,
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
                                GestureDetector(
                                  onTap: (){
                                  },
                                  child: Text(
                                    AppText.apply,
                                    style: AppStyle.textStyleOutfit(
                                      color: AppColor.easternBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              controller.couponList[index].offer,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              controller.couponList[index].description,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.midTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16,);
                  },
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
