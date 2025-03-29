import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:customer_app/app/modules/product_detail/model/similar_product_model.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import 'dashed_rect.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(ProductDetailController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity,100),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 1,
                color: Theme.of(context).primaryColor.withOpacity(.125),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.SEARCHPRODUCT);
                      },
                      child: Image.asset(
                        AssetsPath.searchIcon,
                        height: 20,
                        width: 20,
                        color: AppColor.mainTextColor,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.WISHLIST);
                      },
                      child: Image.asset(
                        AssetsPath.wishlist,
                        height: 24,
                        width: 24,
                        color: AppColor.mainTextColor,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Image.asset(
                      AssetsPath.cartIcon,
                      height: 22,
                      width: 22,
                      color: AppColor.mainTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailController>(
        init: ProductDetailController(),
        builder: (controller) {
          return controller.isLoading ? Center(child: loader()) : controller.productsDetailModel == null ? Container() : Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 370,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              controller.changeImage(index);
                            },
                            autoPlay: true,
                          ),
                          items: controller.productsDetailModel!.images!
                              .map((item) => Stack(
                            children: [
                              Image.network(
                                item.image!,
                                fit: BoxFit.cover,
                                width: Get.width,
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  return SizedBox(
                                    width: Get.width,
                                  );
                                },
                              ),
                            ],
                          )).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 310),
                          child: SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ConstrainedBox(
                                    constraints: const BoxConstraints.expand(height: 24, width: 85),
                                    child: Container(
                                      height: 24,
                                      width: 85,
                                      decoration: BoxDecoration(
                                        color: AppColor.greenColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AssetsPath.star,
                                            height: 18,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 2,),
                                          Text(
                                            controller.productsDetailModel!.productRating ?? "",
                                            style: AppStyle.textStyleOutfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Container(
                                            height: 12,
                                            color: AppColor.whiteColor,
                                            width: 1,
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            "${controller.productsDetailModel!.rating}K",
                                            style: AppStyle.textStyleOutfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        AssetsPath.share,
                                        width: 18,
                                        height: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 320),
                          child: SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.productsDetailModel!.images!.asMap().entries.map((entry) {
                                  return Container(
                                    padding: const EdgeInsets.all(3),
                                    child: Image.asset(
                                      (controller.current == entry.key) ? AssetsPath.halfCircle : AssetsPath.fillCircle,
                                      height: 12,
                                      width: 12,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 360),
                          child: Container(
                            width: Get.width,
                            decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 2),
                                  child: Text(
                                    controller.productsDetailModel!.productName ?? "",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.mainTextColor,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.productsDetailModel!.special!.isEmpty ? controller.productsDetailModel!.price ?? "" : controller.productsDetailModel!.special ?? "",
                                            style: AppStyle.textStyleOutfit(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.mainTextColor,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            controller.productsDetailModel!.special!.isEmpty ? "" : controller.productsDetailModel!.price ?? "",
                                            style: AppStyle.textStyleOutfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.midTextColor,
                                              textDecoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Container(
                                    width: Get.width,
                                    height: 112,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    color: AppColor.greyLightColor,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15,),
                                        Text(
                                          AppText.checkDelivery,
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.mainTextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        TextFormField(
                                          controller: controller.pinCodeController,
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
                                            hintText: AppText.enterPinCode,
                                            hintStyle: AppStyle.textStyleOutfit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.midTextColor,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: (){
                                                controller.checkAvailability();
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
                                        const SizedBox(height: 15,),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                controller.checkboxOptions.isEmpty ? Container() : SizedBox(
                                  height: 110,
                                  width: Get.width,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.checkboxOptions.length,
                                    itemBuilder: (context,index){
                                      bool isLastItem = index == controller.checkboxOptions.length - 1;

                                      return Padding(
                                        padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
                                        child: GestureDetector(
                                          onTap: () async{
                                            controllers.selectVegNonVeg(controller.checkboxOptions[index]);
                                          },
                                          child: Container(
                                            width: 100,
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: controller.checkboxOptions[index].isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,
                                                width: 2
                                              ),
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
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 7,),
                                                Image.network(
                                                  controller.checkboxOptions[index].optionValues[0].image!,
                                                  height: 24,
                                                  width: 24,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container();
                                                  },
                                                ),
                                                const SizedBox(height: 7,),
                                                Text(
                                                  controller.checkboxOptions[index].optionValues[0].text,
                                                  style: AppStyle.textStyleOutfit(
                                                    fontSize: 12,
                                                    fontWeight: controller.checkboxOptions[index].isSelected ? FontWeight.w600 : FontWeight.w400,
                                                    color: controller.checkboxOptions[index].isSelected ? AppColor.mainTextColor : AppColor.midTextColor,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 7,),
                                                Text(
                                                  controller.checkboxOptions[index].optionValues[0].textPrice,
                                                  style: AppStyle.textStyleOutfit(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.mainTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                // controller.checkboxOptions.isEmpty ? Container() : Column(
                                //   children: [
                                //     ListView.builder(
                                //       shrinkWrap: true,
                                //       scrollDirection: Axis.vertical,
                                //       padding: EdgeInsets.zero,
                                //       itemCount: controller.checkboxOptions.length,
                                //       itemBuilder: (context,index){
                                //         return Padding(
                                //           padding: const EdgeInsets.only(left: 20,right: 16,bottom: 10),
                                //           child: Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text(
                                //                 controller.checkboxOptions[index].optionValues[0].text,
                                //                 style: AppStyle.textStyleOutfit(
                                //                   fontSize: 14,
                                //                   fontWeight: FontWeight.w600,
                                //                   color: AppColor.mainTextColor,
                                //                 ),
                                //               ),
                                //               CustomSwitch(
                                //                 value: controller.checkboxOptions[index].isSelected,
                                //                 onChanged: (bool val) async {
                                //                   controller.checkboxOptions[index].isSelected = val;
                                //                   var selectedProduct= controller.checkboxOptions.where((product) => product.isSelected == true).toList();
                                //                   List<String> ids = [];
                                //                   for (var product in selectedProduct) {
                                //                     ids.add(product.optionValues[0].id);
                                //                   }
                                //                   print("$ids");
                                //                   await controller.updatePrice(ids,controller.productsDetailModel?.productId);
                                //                   // controller.toggleServiceSelection(index);
                                //                   // await controller.updatePrice(controller.checkboxOptions[index].optionValues[0].id,controller.productsDetailModel?.productId);
                                //                 },
                                //               ),
                                //             ],
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //     const SizedBox(height: 10,),
                                //   ],
                                // ),
                                const Divider(
                                  color: AppColor.dividerColor,
                                ),
                                controller.option.isEmpty ? Container() : controller.selectOptions.isEmpty ? Container() : Column(
                                  children: [
                                    const SizedBox(height: 24,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: heading(title: AppText.weight, isShow: false),
                                    ),
                                    const SizedBox(height: 12,),
                                    SizedBox(
                                      height: 62,
                                      width: Get.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.selectOptions.length,
                                        itemBuilder: (context,index){
                                          bool isLastItem = index == controller.selectOptions.length - 1;
                                          return Padding(
                                            padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
                                            child: GestureDetector(
                                              onTap: () async {
                                                controller.selectWeight(controller.selectOptions[index]);
                                              },
                                              child: Container(
                                                height: 62,
                                                margin: const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: controller.selectOptions[index].isSelected ? AppColor.easternBlueColor : AppColor.whiteColor,
                                                    width: 2,
                                                  ),
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
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        controller.selectOptions[index].getWeight(),
                                                        style: AppStyle.textStyleOutfit(
                                                          fontSize: 12,
                                                          fontWeight: controller.selectOptions[index].isSelected ? FontWeight.w600 : FontWeight.w400,
                                                          color: controller.selectOptions[index].isSelected ? AppColor.mainTextColor : AppColor.midTextColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "+₹${controller.selectOptions[index].getPrice()}",
                                                        style: AppStyle.textStyleOutfit(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: AppColor.mainTextColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: heading(title: AppText.photoCakeImage, isShow: false),
                                ),
                                const SizedBox(height: 12,),
                                GestureDetector(
                                  onTap: (){
                                    controller.selectFile();
                                  },
                                  child: Container(
                                    height: 66,
                                    margin: const EdgeInsets.symmetric(horizontal: 16),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightBlueColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 58,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: AppColor.whiteColor,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const DashedRect(color: AppColor.blueBgColor, strokeWidth: 1.0, gap: 5.0,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AssetsPath.icUpload,
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(width: 15,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      AppText.chooseImage,
                                                      style: AppStyle.textStyleOutfit(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: AppColor.easternBlueColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      AppText.max8Mb,
                                                      style: AppStyle.textStyleOutfit(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColor.midTextColor,
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
                                  ),
                                ),
                                const SizedBox(height: 24,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    color: AppColor.greyLightColor,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        controller.productsDetailModel!.productType == "Cakes" && controller.productsDetailModel!.messageOnCake == "yes" ? Column(
                                          children: [
                                            const SizedBox(height: 15,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  AppText.messageOnCake,
                                                  style: AppStyle.textStyleOutfit(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.mainTextColor,
                                                  ),
                                                ),
                                                Text(
                                                  "${controller.messageController.text.length}/12",
                                                  style: AppStyle.textStyleOutfit(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.midTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            TextFormField(
                                              controller: controller.messageController,
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              maxLength: 12,
                                              decoration: InputDecoration(
                                                counterText: "",
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
                                                hintText: AppText.enterYourMessage,
                                                hintStyle: AppStyle.textStyleOutfit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.midTextColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ) : Container(),
                                        const SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppText.customProductDescription,
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                            Text(
                                              "${controller.descriptionController.text.length}/100",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.midTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        TextFormField(
                                          controller: controller.descriptionController,
                                          textInputAction: TextInputAction.done,
                                          keyboardType: TextInputType.text,
                                          maxLength: 100,
                                          minLines: 1,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            isDense: true,
                                            filled: true,
                                            fillColor: AppColor.whiteColor,
                                            // contentPadding: const EdgeInsets.only(left: 16,top: 15),
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
                                            hintText: AppText.enterYourDescription,
                                            hintStyle: AppStyle.textStyleOutfit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.midTextColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 25,),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: AppColor.dividerColor),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Text.rich(
                                            TextSpan(
                                              text: "Product ID: ",
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.midTextColor,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: controller.productsDetailModel!.productId.toString(),
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
                                        ListView.builder(
                                          itemCount: 2,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                              child: Column(
                                                children: [
                                                  const Divider(
                                                    color: AppColor.dividerColor,
                                                    thickness: 1,
                                                    height: 0,
                                                  ),
                                                  ExpansionTile(
                                                    iconColor: AppColor.easternBlueColor,
                                                    collapsedIconColor: AppColor.easternBlueColor,
                                                    childrenPadding: EdgeInsets.zero,
                                                    initiallyExpanded: true,
                                                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                                    title: Text(
                                                      index == 0 ? AppText.aboutTheProduct : AppText.productContains,
                                                      style: AppStyle.textStyleOutfit(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColor.mainTextColor,
                                                      ),
                                                    ),
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                                        child: Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                            index == 0 ? controller.productsDetailModel!.descriptionOne ?? "" : controller.productsDetailModel!.altTag ?? "",
                                                            style: AppStyle.textStyleOutfit(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400,
                                                              color: AppColor.midTextColor,
                                                            ),
                                                            textAlign: TextAlign.start,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15,),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppText.customerReviews,
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.mainTextColor,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){},
                                              child: Row(
                                                children: [
                                                  Text(
                                                    AppText.seeAllReviews,
                                                    style: AppStyle.textStyleOutfit(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColor.easternBlueColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Image.asset(
                                                    AssetsPath.chevronRight,
                                                    height: 18,
                                                    width: 18,
                                                    color: AppColor.easternBlueColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        ListView.separated(
                                          itemCount: controller.productsDetailModel!.reviewList!.length >= 2 ? 2 : controller.productsDetailModel!.reviewList!.length,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 10,),
                                                Text(
                                                  controller.productsDetailModel!.reviewList![index].text ?? "",
                                                  style: AppStyle.textStyleOutfit(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.midTextColor,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 24,
                                                      width: 55,
                                                      decoration: BoxDecoration(
                                                        color: AppColor.greenColor,
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Image.asset(
                                                            AssetsPath.star,
                                                            height: 18,
                                                            width: 20,
                                                          ),
                                                          const SizedBox(width: 5,),
                                                          Text(
                                                            controller.productsDetailModel!.reviewList![index].rating ?? "",
                                                            style: AppStyle.textStyleOutfit(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w400,
                                                              color: AppColor.whiteColor,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 5,),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      controller.productsDetailModel!.reviewList![index].author ?? "",
                                                      style: AppStyle.textStyleOutfit(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        color: AppColor.mainTextColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10,),
                                              ],
                                            );
                                          },
                                          separatorBuilder: (BuildContext context, int index) {
                                            return const Divider(
                                              color: AppColor.dividerColor,
                                              thickness: 1,
                                              height: 0,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24,),
                                Container(
                                  height: 162,
                                  width: Get.width,
                                  color: AppColor.yellowLightColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          AppText.recommendedCategories,
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.mainTextColor,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15,),
                                      SizedBox(
                                        height: 80,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.zero,
                                          itemCount: controller.categoryList.length,
                                          itemBuilder: (context,index){
                                            bool isLastItem = index == controller.categoryList.length - 1;

                                            return Padding(
                                              padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
                                              child: GestureDetector(
                                                onTap: (){
                                                  Get.toNamed(Routes.PRODUCTLIST,arguments:
                                                    {
                                                      "categoryName": controller.categoryList[index].categoryName,
                                                      "categorySlag": controller.categoryList[index].typeId
                                                    },
                                                  );
                                                },
                                                child: SizedBox(
                                                  width: 80,
                                                  height: 50,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 80,
                                                        margin: const EdgeInsets.all(2),
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
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.network(
                                                            controller.categoryList[index].image,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                              return Container();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 7,),
                                                      Text(
                                                        controller.categoryList[index].categoryName,
                                                        style: AppStyle.textStyleOutfit(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: AppColor.mainTextColor,
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24,),
                                controller.isSimilarLoading ? loader() : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: heading(
                                        title: AppText.itemsYouHaveViewed,
                                        isShow: false,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    homeMightAlsoLikeView(controller),
                                  ],
                                ),
                                const SizedBox(height: 24,),
                                controller.isSimilarLoading ? loader() : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: heading(
                                        title: AppText.upcomingOccasions,
                                        isShow: false,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    upcomingOccasionsView(controller),
                                  ],
                                ),
                                const SizedBox(height: 24,),
                                SizedBox(
                                  height: 208,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: <Color>[
                                          AppColor.lightBlueColor,
                                          AppColor.whiteColor,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              imageWithText(AssetsPath.icCity,AppText.delivery,AppText.inCities),
                                              imageWithText(AssetsPath.icFaceSmile,AppText.happiness,AppText.guarantee),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              imageWithText(AssetsPath.icDelivery,AppText.onTime,AppText.deliveryAverage),
                                              imageWithText(AssetsPath.icTrusted,AppText.trustedBy,AppText.millions),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: GetBuilder<ProductDetailController>(
        builder: (controller) {
          return controller.isLoading ? const SizedBox(
            height: 0,
            width: 0,
          ) : SizedBox(
            height: 104,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsPath.delivery,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10,),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: AppText.getTodayOrderWithin,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainTextColor,
                          ),
                          children: [
                            TextSpan(
                              text: controller.formatDuration(controller.timeLeft),
                              style: AppStyle.textStyleOutfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.illusionTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          await controller.uploadImage();
                          Get.toNamed(Routes.ADDSON,arguments: {
                            "productId": controller.productsDetailModel!.productId,
                            "sesKey": controller.productsDetailModel!.sesskey,
                          });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: AppColor.mainTextColor,
                          ),
                          child: Center(
                            child: Text(
                              controller.productsDetailModel == null ? "Add to cart" :
                              "Add to cart (${controller.productsDetailModel!.special!.isEmpty ? controller.productsDetailModel!.price ?? "" : controller.productsDetailModel!.special ?? ""})",
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
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
          );
        }
      ),
    );
  }

  homeMightAlsoLikeView(ProductDetailController controller) {
    return SizedBox(
      height: 262,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.similarProducts.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.similarProducts.length - 1;
          final product = controller.similarProducts[index];
          return productView(product,isLastItem,controller);
        },
      ),
    );
  }

  productView(SimilarProducts product, bool isLastItem, ProductDetailController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
      child: GestureDetector(
        onTap: (){
          // controller.productSlug = product.typeId;
          // controller.getData();
          // Get.to(ProductDetailScreen(),arguments: product.typeId,);
          // Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
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
                      height: 172,
                      width: 182,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return const SizedBox(
                          height: 172,
                          width: 182,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          product.productTag.isEmpty ? Container() :  Container(
                            height: 22,
                            decoration: BoxDecoration(
                              color: AppColor.chipGreenColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  product.productTag,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: AppColor.mainTextColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AssetsPath.wishlist,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 92,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              AppText.earliestDelivery,
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.midTextColor,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              product.expectedDelivery == "Today" ? "Today" : "2-3 days",
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.successColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.special.isEmpty ? product.price : product.special,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  product.special.isEmpty ? "" : product.price,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.midTextColor,
                                    textDecoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   height: 20,
                            //   width: 47,
                            //   decoration: BoxDecoration(
                            //     color: AppColor.greenColor,
                            //     borderRadius: BorderRadius.circular(50),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       const SizedBox(width: 5,),
                            //       Image.asset(
                            //         AssetsPath.star,
                            //         height: 14,
                            //         width: 14,
                            //       ),
                            //       const SizedBox(width: 5,),
                            //       Text(
                            //         product.,
                            //         style: AppStyle.textStyleOutfit(
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColor.whiteColor,
                            //         ),
                            //       ),
                            //       const SizedBox(width: 5,),
                            //     ],
                            //   ),
                            // ),
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
      ),
    );
  }

  imageWithText(String image, String title,String subTitle){
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 24,
            width: 24,
          ),
          const SizedBox(height: 10,),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: title,
              style: AppStyle.textStyleOutfit(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.mainTextColor,
              ),
              children: [
                TextSpan(
                  text: subTitle,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.mainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  upcomingOccasionsView(ProductDetailController controller) {
    return SizedBox(
      height: 210,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.occasionsList.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.occasionsList.length - 1;
          final product = controller.occasionsList[index];
          return productViewOccasions(product,isLastItem);
        },
      ),
    );
  }

  productViewOccasions(Occasion product, bool isLastItem) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(Routes.PRODUCTLIST,arguments:
            {
              "categoryName": product.categoryName,
              "categorySlag": product.typeId,
            },
          );
        },
        child: SizedBox(
          width: 144,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      child: Image.network(
                        product.image,
                        height: 186,
                        width: 144,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return const SizedBox(
                            height: 186,
                            width: 144,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.blackColor.withOpacity(0.2),
                          AppColor.blackColor.withOpacity(0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 186,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 15,),
                            Text(
                              product.smallText,
                              style: AppStyle.textStyleOutfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColor.whiteColor,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              product.categoryName,
                              style: AppStyle.textStyleOutfit(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              height: 28,
                              width: 76,
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Text(
                                    AppText.shopNow,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.easternBlueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AssetsPath.occasions,
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
