import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import '../controller/adds_on_controller.dart';
import '../model/adds_on_model.dart';

class AddsOnScreen extends StatelessWidget {
  const AddsOnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.addsOn),
      body: GetBuilder<AddsOnController>(
        init: AddsOnController(),
        builder: (controller) {
          return controller.isLoading ? loader() :
          controller.addsOnModel == null ? Center(
            child: Text(
              "No Data Found",
              style: AppStyle.textStyleOutfit(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.mainTextColor,
              ),
            ),
          ) :
          DefaultTabController(
            length: controller.addsOnModel!.addOnProducts!.addonProducts!.length,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      productOptionView(controller.addsOnModel!.addOnProducts!.productDetail),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: TabBar(
                          isScrollable: true,
                          indicatorColor: AppColor.easternBlueColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          padding: EdgeInsets.zero,
                          labelStyle: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                          tabAlignment: TabAlignment.start,
                          unselectedLabelStyle: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.midTextColor,
                          ),
                          tabs: controller.addsOnModel!.addOnProducts!.addonProducts!.map((category) {
                            return Tab(
                              child: Text(
                                category.title!,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
              ],
              body: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: controller.addsOnModel!.addOnProducts!.addonProducts!.map((category) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 231,
                            mainAxisSpacing: 15,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: category.data!.length,
                          itemBuilder: (context,index){
                            final product = category.data![index];
                            return productView(product,controller);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: GetBuilder<AddsOnController>(
        builder: (controller) {
          return Container(
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
              child: Row(
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
                        controller.addsOnModel == null ? "" : controller.addsOnModel!.totalAmount ?? "",
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
                      Get.toNamed(Routes.CART);
                    },
                    child: Container(
                      height: 48,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColor.mainTextColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          AppText.continueText,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget productOptionView(ProductDetail? productDetail) {
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
                productDetail!.image ?? "",
                height: 88,
                width: 88,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AssetsPath.cake,
                    height: 88,
                    width: 88,
                    fit: BoxFit.cover,
                  );
                },
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
                    productDetail.productName ?? "",
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
                          text: productDetail.expectedDelivery ?? "",
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

  productView(Data product, AddsOnController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 182,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.network(
                  product.thumb ?? "",
                  height: 156,
                  width: 182,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AssetsPath.cake,
                      height: 156,
                      width: 182,
                      fit: BoxFit.cover,
                    );
                  },
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
                      product.name ?? "",
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
                          product.price ?? "0",
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.addRemove(product);
                          },
                          child: Container(
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: product.isAdded ? AppColor.errorColor : AppColor.mainTextColor),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Center(
                              child: Text(
                                product.isAdded ? AppText.remove : AppText.add,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: product.isAdded ? AppColor.errorColor : AppColor.mainTextColor,
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
          ),
        ],
      ),
    );
  }

}
