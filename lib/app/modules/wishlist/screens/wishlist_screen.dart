import 'package:customer_app/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:customer_app/app/modules/wishlist/model/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.wishlist,
        trailing: GestureDetector(
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
      ),
      body: GetBuilder<WishListController>(
        init: WishListController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisExtent: 286,
                mainAxisSpacing: 15,
              ),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: controller.wishList.length,
              itemBuilder: (context,index){
                return productView(controller.wishList[index],controller);
              },
            ),
          );
        },
      ),
    );
  }

  productView(WishList product, WishListController controller) {
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
                    product.image!,
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
                        product.productTag!.isEmpty ? Container() :  Container(
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppColor.chipGreenColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                product.productTag ?? "",
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
                        GestureDetector(
                          onTap: (){
                            controller.removeWishList(product.productId!);
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
                                AssetsPath.closeIcon,
                                height: 10,
                                width: 20,
                                color: AppColor.whiteColor,
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
                height: 144,
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
                        product.productName ?? "",
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
                                product.special!.isEmpty ? product.price ?? "" : product.special ?? "",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                product.special!.isEmpty ? "" : product.price ?? "",
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
                                  product.rating ?? "",
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
                      SizedBox(
                        height: 36,
                        child: GestureDetector(
                          onTap: (){
                            controller.moveToCart(product.productId!);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(color:AppColor.mainTextColor,width: 2),
                            ),
                            child: Center(
                              child: Text(
                                AppText.moveToCart,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleOutfit(
                                  color: AppColor.mainTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
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
