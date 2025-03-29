import 'package:customer_app/app/modules/cart/screens/step_four_screen.dart';
import 'package:customer_app/app/modules/cart/screens/step_one_screen.dart';
import 'package:customer_app/app/modules/cart/screens/step_three_screen.dart';
import 'package:customer_app/app/modules/cart/screens/step_two_screen.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../home/model/home_model.dart';
import '../controller/cart_controller.dart';
import 'widgets/flutter_step_indicator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity,100),
        child: Container(
          height: 130,
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
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                    Text(
                      AppText.cart,
                      style: AppStyle.textStyleOutfit(
                        color: AppColor.mainTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                GetBuilder<CartController>(
                  init: CartController(),
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: FlutterStepIndicator(
                            height: 28,
                            paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                            positiveColor: AppColor.successColor,
                            progressColor: AppColor.easternBlueColor,
                            negativeColor: AppColor.lightBlueColor,
                            padding: const EdgeInsets.all(4),
                            list: controller.list,
                            division: controller.counter,
                            onChange: (i) {},
                            page: controller.currentStep,
                            onClickItem: (p0) {
                              controller.currentStep = p0;
                            },
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Stack(
            children: [
              Visibility(
                visible: controller.currentStep >= 0 ? true : false,
                child: const StepOneScreen(),
              ),
              Visibility(
                visible: controller.currentStep >= 1 ? true : false,
                child: const StepTwoScreen(),
              ),
              Visibility(
                visible: controller.currentStep >= 2 ? true : false,
                child: const StepTreeScreen(),
              ),
              Visibility(
                visible: controller.currentStep >= 3 ? true : false,
                child: const StepFourScreen(),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
          return controller.cartProduct?.result?.products
              ?.isEmpty ?? true ? const SizedBox(
            height: 0,
            width: 0,
          ) : Container(
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
                  controller.currentStep == 3 ?
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.totalAmount,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                controller.total,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              controller.payNow();
                            },
                            child: Container(
                              height: 48,
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppColor.mainTextColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  AppText.payNow,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : GestureDetector(
                    onTap: (){
                      controller.nextStep();
                    },
                    child: commonButton(title: AppText.placeOrder),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget productOptionView() {
    return Container(
      height: 120,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[
            AppColor.lightBlueColor.withOpacity(0.5),
            AppColor.lightBlueColor.withOpacity(0.01),
          ],
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
                height: 88,
                width: 88,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coffee chocochip cake",
                    style: AppStyle.textStyleOutfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5,),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: AppText.earliestDelivery,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Today",
                          style: AppStyle.textStyleOutfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.successColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    height: 28,
                    width: 170,
                    decoration: BoxDecoration(
                      color: AppColor.chipGreenColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsPath.icCheckCircle,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            AppText.productAddedCart,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.successColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  productView(Products product) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: 182,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 156,
                    width: 182,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7,),
            Positioned(
              bottom: 0,
              child: Container(
                height: 76,
                width: 182,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.special.isEmpty ? product.price : product.special,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColor.mainTextColor),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Center(
                              child: Text(
                                AppText.add,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.mainTextColor,
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
            ),
          ],
        ),
      ),
    );
  }
}