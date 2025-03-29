import 'package:customer_app/app/modules/category/screens/widgets/custom_expansion_tile.dart';
import 'package:customer_app/app/modules/category/screens/widgets/custom_sub_expansion_tile.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import '../controller/category_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(Get.width,70),
        child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return Container(
              height: 100,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.DELIVERYCITIES);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColor.darkLightColor,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AssetsPath.location,
                                      width: 14,
                                      height: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery',
                                      style: AppStyle.textStyleOutfit(
                                        color: AppColor.mainTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controller.selectedCity.isEmpty ? 'All' : controller.selectedCity,
                                          style: AppStyle.textStyleOutfit(
                                            color: AppColor.mainTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Image.asset(
                                          AssetsPath.down,
                                          height: 20,
                                          width: 20,
                                          color: AppColor.mainTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 15,),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsPath.bellIcon,
                                height: 20,
                                width: 20,
                                color: AppColor.mainTextColor,
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
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(Routes.CART);
                                },
                                child: Image.asset(
                                  AssetsPath.cartIcon,
                                  height: 22,
                                  width: 22,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      body: GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          return DefaultTabController(
            length: 3,
            child: controller.isLoading ? loader() : controller.categoryModel == null ? Center(
              child: Text(
                "No Category Found",
                style: AppStyle.textStyleOutfit(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.mainTextColor,
                ),
              ),
            ) : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: Get.width,
                  child: TabBar(
                    isScrollable: false,
                    indicatorColor: AppColor.easternBlueColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.zero,
                    labelStyle: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                    // tabAlignment: TabAlignment.start,
                    unselectedLabelStyle: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                    tabs: const [
                      Tab(
                        child: Center(
                          child: Text(
                            "Gift type",
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
                          child: Text(
                            "Occasion",
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
                          child: Text(
                            "International",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: controller.categoryModel!.giftType.length,
                        itemBuilder: (context,index){
                          bool isFirstItem = index == 0;
                          bool isLastItem = index == controller.categoryModel!.giftType.length - 1;
                          EdgeInsets itemPadding = EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: isFirstItem ? 8 : 0,
                            bottom: isLastItem ? 20 : 0,
                          );

                          return Padding(
                            padding: itemPadding,
                            child: CustomExpansionTile(
                              image: controller.categoryModel!.giftType[index].image,
                              title: Text(
                                controller.categoryModel!.giftType[index].categoryName ?? "",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              children: controller.categoryModel!.giftType[index].subCategories!.map((category){
                                return CustomSubExpansionTile(
                                  title: category.subCategoriesChilds != null ? Text(
                                    category.categoryName ?? "",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ) : GestureDetector(
                                    onTap: (){
                                      Get.toNamed(
                                        Routes.PRODUCTLIST,
                                        arguments: {
                                          "categoryName": category.categoryName,
                                          "categorySlag": category.typeId,
                                        },
                                      );
                                    },
                                    child: Text(
                                      category.categoryName ?? "",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ),
                                  children: category.subCategoriesChilds == null ? [] : category.subCategoriesChilds!.map((subCategory){
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.toNamed(
                                            Routes.PRODUCTLIST,
                                            arguments: {
                                              "categoryName": subCategory.categoryName,
                                              "categorySlag": subCategory.typeId,
                                            },
                                          );
                                        },
                                        child: Text(
                                          subCategory.categoryName ?? "",
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.midTextColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      ),
                      ListView.builder(
                        itemCount: controller.categoryModel!.occasion.length,
                        itemBuilder: (context,index){
                          bool isFirstItem = index == 0;
                          bool isLastItem = index == controller.categoryModel!.occasion.length - 1;
                          EdgeInsets itemPadding = EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: isFirstItem ? 8 : 0,
                            bottom: isLastItem ? 20 : 0,
                          );

                          return Padding(
                            padding: itemPadding,
                            child: CustomExpansionTile(
                              image: controller.categoryModel!.occasion[index].image,
                              title: Text(
                                controller.categoryModel!.occasion[index].categoryName ?? "",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              children: controller.categoryModel!.occasion[index].subCategories!.map((category){
                                return CustomSubExpansionTile(
                                  title: GestureDetector(
                                    onTap: (){
                                      Get.toNamed(
                                        Routes.PRODUCTLIST,
                                        arguments: {
                                          "categoryName": category.categoryName,
                                          "categorySlag": category.typeId,
                                        },
                                      );
                                    },
                                    child: Text(
                                      category.categoryName ?? "",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ),
                                  children: category.subCategoriesChilds == null ? [] : category.subCategoriesChilds!.map((subCategory){
                                    return GestureDetector(
                                      onTap: (){
                                        Get.toNamed(
                                          Routes.PRODUCTLIST,
                                          arguments: {
                                            "categoryName": subCategory.categoryName,
                                            "categorySlag": subCategory.typeId,
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          subCategory.categoryName ?? "",
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.midTextColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      ),
                      ListView.builder(
                        itemCount: controller.categoryModel!.international.length,
                        itemBuilder: (context,index){
                          bool isFirstItem = index == 0;
                          bool isLastItem = index == controller.categoryModel!.international.length - 1;
                          EdgeInsets itemPadding = EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: isFirstItem ? 20 : 12,
                            bottom: isLastItem ? 20 : 0,
                          );

                          return Padding(
                            padding: itemPadding,
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.PRODUCTLIST,arguments: {
                                    "categoryName": controller.categoryModel!.international[index].categoryName,
                                    "categorySlag": controller.categoryModel!.international[index].typeId,
                                  },
                                );
                              },
                              child: Container(
                                height: 88,
                                decoration: BoxDecoration(
                                  color: AppColor.greyLightColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      controller.categoryModel!.international[index].image == null || controller.categoryModel!.international[index].image!.isEmpty ? Container() : Center(
                                        child: Image.network(
                                          controller.categoryModel!.international[index].image ?? "",
                                          height: 72,
                                          width: 77,
                                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                            return const SizedBox(
                                              height: 72,
                                              width: 77,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          controller.categoryModel!.international[index].categoryName ?? "",
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.mainTextColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
