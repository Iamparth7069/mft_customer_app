import 'package:customer_app/app/modules/product/model/product_model.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import '../controller/product_list_controller.dart';
import 'bottom_sheet_sort.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GetBuilder<ProductListController>(
            init: ProductListController(),
            builder: (controller) {
              return (controller.isProductLoading && controller.productsModelList.isEmpty) ? loader() : Column(
                children: [
                  Container(
                    height: 60,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.categoryName.split("/").first,
                                    style: AppStyle.textStyleOutfit(
                                      color: AppColor.mainTextColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${controller.productTotal} items',
                                    style: AppStyle.textStyleOutfit(
                                      color: AppColor.midTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsPath.searchIcon,
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
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          popularCitiesView(controller),
                          const SizedBox(height: 20,),
                          allCitiesView(controller),
                          if (controller.isFetchingNewPage)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: loader(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
        ),
      ),
      bottomNavigationBar: GetBuilder<ProductListController>(
          builder: (controller) {
            return Container(
              height: 50,
              color: AppColor.whiteColor,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.showBottomFilter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsPath.filter,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            AppText.filter,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.illusionTextColor,
                            ),
                            child: Center(
                              child: Text(
                                "${controller.count}",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: AppColor.dividerColor,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: showBottomSheet,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsPath.sort,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            AppText.sort,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.mainTextColor,
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
      ),
    );
  }

  popularCitiesView(ProductListController controller) {
    return controller.categoryList.isEmpty ? Container() : Container(
      height: 112,
      width: Get.width,
      color: AppColor.yellowLightColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 23),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: controller.categoryList.length,
          itemBuilder: (context,index){
            bool isLastItem = index == controller.categoryList.length - 1;

            return Padding(
              padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
              child: SizedBox(
                width: 80,
                height: 48,
                child: Column(
                  children: [
                    Container(
                      height: 48,
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
                      child: FractionallySizedBox(
                        widthFactor: 0.8, // 80% of the parent's width
                        heightFactor: 0.8,
                        child: Image.network(
                          controller.categoryList[index].image,
                          fit: BoxFit.contain,
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
            );
          },
        ),
      ),
    );
  }

  allCitiesView(ProductListController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisExtent: 240,
          mainAxisSpacing: 15,
        ),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.productsModelList.length,
        itemBuilder: (context,index){
          return productView(controller.productsModelList[index],controller);
        },
      ),
    );
  }

  productView(ProductsModel product, ProductListController controller) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 172,
                    width: Get.width,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return SizedBox(
                        height: 172,
                        width: Get.width,
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
                            color: extractColorFromCss(product.tagClass),
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
                                  color: AppColor.whiteColor,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.addOrRemoveWishList(product.productId,product.wishListProduct);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: AppColor.mainTextColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Image.asset(
                                product.wishListProduct.isEmpty ? AssetsPath.wishlist : AssetsPath.wishlistFill,
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
              left: 0,
              right: 0,
              child: Container(
                height: 92,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
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
                        overflow: TextOverflow.ellipsis,
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
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                product.special.isEmpty ? "" : product.price,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 43,
                            decoration: BoxDecoration(
                              color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsPath.star,
                                  height: 13,
                                  width: 13,
                                ),
                                const SizedBox(width: 2,),
                                Text(
                                  "4.5",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ],
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


  void showBottomSheet() {
    Get.bottomSheet(
      const BottomSheetSort(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

}
