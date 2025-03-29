import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';
import '../../product/model/product_model.dart';
import '../controller/same_day_delivery_controller.dart';

class SameDayDeliveryScreen extends StatelessWidget {
  const SameDayDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GetBuilder<SameDayDeliveryController>(
          init: SameDayDeliveryController(),
          builder: (controller) {
            return Column(
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
                            Text(
                              AppText.sameDayDelivery,
                              style: AppStyle.textStyleOutfit(
                                color: AppColor.mainTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
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
                ),
                (controller.isLoading) ? loader() : Expanded(
                  child: controller.categoryModel == null ? Center(
                    child: Text(
                      "No Category Found",
                      style: AppStyle.textStyleOutfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColor.mainTextColor,
                      ),
                    ),
                  )  : DefaultTabController(
                    length: controller.categoryModel!.giftType[0].subCategories!.length,
                    child: Column(
                      children: [
                        if (controller.categoryModel!.giftType[0].subCategories!.isNotEmpty)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          controller.showBottomSheet();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: AppColor.whiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor.mainTextColor.withOpacity(0.15),
                                                offset: const Offset(0.0, 0.0), //(x,y)
                                                blurRadius: 4.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AssetsPath.icSwitchVertical,
                                                width: 24,
                                                height: 24,
                                              ),
                                              const SizedBox(width: 2,),
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
                                      const SizedBox(width: 15,),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          width: Get.width,
                                          child: TabBar(
                                            controller: controller.tabController,
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
                                            onTap: (index){
                                              controller.selectCategory(index);
                                            },
                                            tabs: controller.categoryModel!.giftType[0].subCategories!.map((category) {
                                              return Tab(
                                                child: Text(
                                                  category.categoryName!,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Expanded(
                                  child: (controller.isProductLoading && controller.productsModelList.isEmpty) ? loader() : controller.productsModelList.isEmpty ? Container() : Stack(
                                    children: [
                                      GridView.builder(
                                        controller: controller.scrollController,
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                          crossAxisCount: 2,
                                          height: 240,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 16
                                        ),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.only(left: 16,right: 16),
                                        itemCount: controller.productsModelList.length,
                                        itemBuilder: (context,index){
                                          bool isLastItem = index == controller.productsModelList.length - 1;

                                          final product = controller.productsModelList[index];
                                          return productView(product,isLastItem,controller);
                                        },
                                      ),
                                      if (controller.isFetchingNewPage == true)
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: loader(),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  popularCitiesView(SameDayDeliveryController controller) {
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        controller.categoryList[index].image,
                        height: 48,
                        width: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return const SizedBox(
                            height: 48,
                            width: 80,
                          );
                        },
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

  // allCitiesView(SameDayDeliveryController controller) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: GridView.builder(
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 5,
  //         mainAxisExtent: 240,
  //         mainAxisSpacing: 15,
  //       ),
  //       shrinkWrap: true,
  //       padding: EdgeInsets.zero,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: controller.productsModelList.length,
  //       itemBuilder: (context,index){
  //         return productView(controller.productsModelList[index]);
  //       },
  //     ),
  //   );
  // }

  // productView(ProductsModel product) {
  //   return GestureDetector(
  //     onTap: (){
  //       // Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.productType);
  //       Get.toNamed(Routes.PRODUCTDETAIL,arguments: "red-love-2611");
  //     },
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Stack(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(8),
  //             child: Stack(
  //               children: [
  //                 Image.network(
  //                   product.image,
  //                   height: 172,
  //                   width: Get.width,
  //                   fit: BoxFit.cover,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       product.productTag.isEmpty ? Container() :  Container(
  //                         height: 22,
  //                         decoration: BoxDecoration(
  //                           color: AppColor.chipGreenColor,
  //                           borderRadius: BorderRadius.circular(50),
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(horizontal: 10),
  //                           child: Center(
  //                             child: Text(
  //                               product.productTag,
  //                               style: AppStyle.textStyleOutfit(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: AppColor.mainTextColor,
  //                               ),
  //                               maxLines: 1,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10),
  //                         child: Container(
  //                           height: 32,
  //                           width: 32,
  //                           decoration: BoxDecoration(
  //                             color: AppColor.mainTextColor.withOpacity(0.8),
  //                             borderRadius: BorderRadius.circular(50),
  //                           ),
  //                           child: Center(
  //                             child: Image.asset(
  //                               AssetsPath.wishlist,
  //                               height: 20,
  //                               width: 20,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           const SizedBox(height: 7,),
  //           Positioned(
  //             bottom: 0,
  //             left: 0,
  //             right: 0,
  //             child: Container(
  //               height: 92,
  //               width: Get.width,
  //               decoration: BoxDecoration(
  //                 color: AppColor.whiteColor,
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       product.name,
  //                       style: AppStyle.textStyleOutfit(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColor.mainTextColor,
  //                       ),
  //                       maxLines: 1,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Text(
  //                           AppText.earliestDelivery,
  //                           style: AppStyle.textStyleOutfit(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.w400,
  //                             color: AppColor.midTextColor,
  //                           ),
  //                         ),
  //                         const SizedBox(width: 5,),
  //                         Text(
  //                           product.expectedDelivery == "Today" ? "Today" : "2-3 days",
  //                           style: AppStyle.textStyleOutfit(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.w600,
  //                             color: AppColor.successColor,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Text(
  //                               product.special.isEmpty ? product.price : product.special,
  //                               style: AppStyle.textStyleOutfit(
  //                                 fontSize: 13,
  //                                 fontWeight: FontWeight.w600,
  //                                 color: AppColor.mainTextColor,
  //                               ),
  //                             ),
  //                             const SizedBox(width: 5,),
  //                             Text(
  //                               product.special.isEmpty ? "" : product.price,
  //                               style: AppStyle.textStyleOutfit(
  //                                 fontSize: 11,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: AppColor.midTextColor,
  //                                 textDecoration: TextDecoration.lineThrough,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Container(
  //                           height: 20,
  //                           width: 43,
  //                           decoration: BoxDecoration(
  //                             color: AppColor.greenColor,
  //                             borderRadius: BorderRadius.circular(50),
  //                           ),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Image.asset(
  //                                 AssetsPath.star,
  //                                 height: 13,
  //                                 width: 13,
  //                               ),
  //                               const SizedBox(width: 2,),
  //                               Text(
  //                                 product.rating,
  //                                 style: AppStyle.textStyleOutfit(
  //                                   fontSize: 11,
  //                                   fontWeight: FontWeight.w400,
  //                                   color: AppColor.whiteColor,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  productView(ProductsModel product, bool isLastItem, SameDayDeliveryController controller) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  product.productTag.isEmpty ? Container() :  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: GestureDetector(
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
                  ),
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
                                  fontSize: 12,
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
                            width: 50,
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
                                const SizedBox(width: 2,),
                                Text(
                                  product.rating,
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


class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
    extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
  })  : assert(crossAxisCount > 0),
        assert(mainAxisSpacing >= 0),
        assert(crossAxisSpacing >= 0),
        assert(height > 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// The height of the crossAxis.
  final double height;

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(
      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}