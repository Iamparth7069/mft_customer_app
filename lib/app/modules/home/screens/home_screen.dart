import 'package:customer_app/app/modules/home/controller/home_controller.dart';
import 'package:customer_app/app/modules/home/model/home_model.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../theme/app_style.dart';
import '../../../routes/app_pages.dart';
import '../model/recent_data.dart';
import 'custom_carousel.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final double expandedHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.isLoading ? loader() : Stack(
            children: [
              NestedScrollView(
                controller: controller.scrollController,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: expandedHeight,
                      scrolledUnderElevation: 0,
                      backgroundColor: AppColor.whiteColor,
                      pinned: true,
                      floating: true,
                      collapsedHeight: 140,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 1,
                        titlePadding: EdgeInsets.zero,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.DELIVERYCITIES);
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                color: controller.isTitleSticky ? AppColor.darkLightColor : AppColor.whiteColor,
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
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Delivery',
                                                  style: AppStyle.textStyleOutfit(
                                                    color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller.selectedCity.isEmpty ? 'All' : controller.selectedCity,
                                                      style: AppStyle.textStyleOutfit(
                                                        color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Image.asset(
                                                      AssetsPath.down,
                                                      height: 20,
                                                      width: 20,
                                                      color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
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
                                          GestureDetector(
                                            onTap: (){
                                              Get.toNamed(Routes.NOTIFICATION);
                                            },
                                            child: Image.asset(
                                              AssetsPath.bellIcon,
                                              height: 20,
                                              width: 20,
                                              color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
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
                                              color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
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
                                              color: controller.isTitleSticky ? AppColor.mainTextColor : AppColor.whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              controller.isTitleSticky ? SizedBox(
                                height: 48,
                                width: Get.width,
                                child: searchBar(true),
                              ) : Container()
                            ],
                          ),
                        ),
                        background: SizedBox(
                          child: GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (controller) {
                              return Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  controller.homeModelData == null ? Container() : Carousel(
                                    pages: controller.homeModelData!.banners!.map((e) {
                                      return Stack(
                                        children: [
                                          Container(
                                            width: Get.width,
                                            height: expandedHeight,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  e.image,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: expandedHeight - 230,),
                                                  Text(
                                                    e.categoryName,
                                                    style: AppStyle.textStyleOutfit(
                                                      color: AppColor.whiteColor,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 32,
                                                    ),
                                                  ),
                                                  // const SizedBox(height: 10,),
                                                  // Text(
                                                  //   'Send plants for meaningful \ngifting moment',
                                                  //   style: AppStyle.textStyleOutfit(
                                                  //     color: AppColor.whiteColor,
                                                  //     fontWeight: FontWeight.w400,
                                                  //     fontSize: 16,
                                                  //   ),
                                                  // ),
                                                  const SizedBox(height: 125,),
                                                  GestureDetector(
                                                    onTap: (){
                                                      Get.toNamed(
                                                        Routes.PRODUCTLIST,
                                                        arguments: {
                                                          "categoryName": e.categoryName,
                                                          "categorySlag": e.typeId,
                                                        },
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      width: 100,
                                                      child: commonButton(title: AppText.buyNow),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          IgnorePointer(
                                            child: Container(
                                              height: expandedHeight,
                                              color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                    onPageChanged: ({required bool isLastPage}) => controller.changePage(isLastPage),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      bottom: !controller.isTitleSticky ? PreferredSize(
                        preferredSize: const Size.fromHeight(0.0),
                        child: Transform.translate(
                          offset: const Offset(0, 24),
                          child: searchBar(false),
                        ),
                      ) : PreferredSize(
                        preferredSize: const Size.fromHeight(0.0),
                        child: Container()
                      ),
                    ),
                  ];
                },
                body: GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: controller.homeModelData == null ? Container() : Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    AppColor.pinkColor1.withOpacity(0.5),
                                    AppColor.pinkColor1.withOpacity(0.01),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppText.yourDelivery,
                                              style: AppStyle.textStyleOutfit(
                                                color: AppColor.darkPinkColor1,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Bouquet of emot..,',
                                                  style: AppStyle.textStyleOutfit(
                                                    color: AppColor.mainTextColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.offAllNamed(Routes.DASHBOARD,arguments: 2);
                                                  },
                                                  child: Text(
                                                    '+4 more',
                                                    style: AppStyle.textStyleOutfit(
                                                      color: AppColor.easternBlueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              AppText.todayDelivery,
                                              style: AppStyle.textStyleOutfit(
                                                color: AppColor.mainTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AssetsPath.lightIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                const SizedBox(width: 6,),
                                                Text(
                                                  controller.formatDuration(controller.timeLeft),
                                                  style: AppStyle.textStyleOutfit(
                                                    color: AppColor.darkPinkColor1,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          mainCategoryView(controller),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: heading(
                              title: AppText.bestSellingItems,
                              isShow: true,
                              onTap: (){
                                // Get.toNamed(Routes.PRODUCTLIST,arguments: "bestSelling");
                              }
                            ),
                          ),
                          const SizedBox(height: 20,),
                          bestSellingItemsView(controller),
                          const SizedBox(height: 40,),
                          shopBuyGender(controller),
                          const SizedBox(height: 40,),
                          shopByCategory(controller),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: heading(
                              title: AppText.homeMightAlsoLike,
                              isShow: true,
                              onTap: (){
                                Get.toNamed(
                                  Routes.PRODUCTLIST,
                                  arguments: {
                                    "categoryName": controller.homeModelData!.youMayAlsoLike![0].categoryName,
                                    "categorySlag": controller.homeModelData!.youMayAlsoLike![0].typeId,
                                  },
                                );
                              }
                            ),
                          ),
                          const SizedBox(height: 20,),
                          homeMightAlsoLikeView(controller),
                          const SizedBox(height: 40,),
                          shopByOccasions(controller),
                          Image.asset(
                            AssetsPath.deliveryOrder,
                          ),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: heading(
                              title: AppText.itemsYouHaveViewed,
                              isShow: false,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          controller.recentView.isEmpty ? Container() : recentViewItem(controller),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: heading(
                              title: AppText.plantsForEveryVibe,
                              isShow: false,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          plantsForEveryVibeView(controller),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: heading(
                              title: AppText.sendGiftAbroad,
                              isShow: false,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          sendGiftAbroadView(controller),
                          bottomText(controller),
                        ],
                      ),
                    );
                  }
                ),
              ),
              !controller.isTitleSticky ? Container() : Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      controller.scrollTop();
                    },
                    child: Container(
                      height: 35,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: AppColor.mainTextColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsPath.chevronUp,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 3,),
                          Text(
                            AppText.backToTop,
                            textAlign: TextAlign.center,
                            style: AppStyle.textStyleOutfit(
                              color: AppColor.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget searchBar(bool isShowBoarder){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.SEARCHPRODUCT);
      },
      child: SizedBox(
        height: 48,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isShowBoarder ? Border.all(
                color: AppColor.dividerColor,
                width: 1,
              ) : null,
              color: AppColor.whiteColor,
            ),
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Image.asset(
                  AssetsPath.searchIcon,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 20,),
                Text(
                  AppText.search,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyLightIconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  mainCategoryView(HomeController controller) {
    return SizedBox(
      height: 72,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeModelData!.homeImages!.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.homeModelData!.homeImages!.length - 1;

          return Padding(
              padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(Routes.PRODUCTLIST,arguments:
                  {
                    "categoryName": controller.homeModelData!.homeImages![index].categoryName,
                    "categorySlag": controller.selectedCity.isEmpty ? controller.homeModelData!.homeImages![index].typeId
                        : "${controller.homeModelData!.homeImages![index].typeId}/${controller.selectedCity.toLowerCase()}"
                  },
                );
              },
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        controller.homeModelData!.homeImages![index].image,
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
                    Center(
                      child: Text(
                        controller.homeModelData!.homeImages![index].categoryName,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainTextColor,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bestSellingItemsView(HomeController controller) {
    return SizedBox(
      height: 262,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeModelData!.bestSeller!.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.homeModelData!.bestSeller!.length - 1;

          final product = controller.homeModelData!.bestSeller![index];
          return productView(product,isLastItem,controller);
        },
      ),
    );
  }

  shopBuyGender(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": controller.homeModelData!.shopByGender![1].categoryName,
                    "categorySlag": controller.homeModelData!.shopByGender![1].typeId,
                  },
                );
              },
              child: Container(
                height: 177,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(78),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.homeModelData!.shopByGender![1].image
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppText.giftForHim,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColor.easternBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          AssetsPath.chevronRight,
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": controller.homeModelData!.shopByGender![0].categoryName,
                    "categorySlag": controller.homeModelData!.shopByGender![0].typeId,
                  },
                );
              },
              child: Container(
                height: 177,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(78),
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.homeModelData!.shopByGender![0].image
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppText.giftForHer,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColor.easternBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          AssetsPath.chevronRight,
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  shopByCategory(HomeController controller) {
    return Container(
      height: 530,
      width: Get.width,
      color: AppColor.yellowLightColor,
      child: DefaultTabController(
        length: controller.homeModelData!.shopByCategories!.length,
        child: Column(
          children: [
            const SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": controller.homeModelData!.shopByCategoriesText!.title,
                    "categorySlag": controller.homeModelData!.shopByCategoriesText!.typeId,
                  },
                );
              },
              child: shopBy(
                bgColor: AppColor.yellowMidColor,
                title: controller.homeModelData!.shopByCategoriesText!.title,
                subTitle: controller.homeModelData!.shopByCategoriesText!.description,
                image: controller.homeModelData!.shopByCategoriesText!.image,
              ),
            ),
            const SizedBox(height: 20,),
            if (controller.homeModelData!.shopByCategories!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      tabs: controller.homeModelData!.shopByCategories!.map((category) {
                        return Tab(
                          child: Text(
                            category.categoryName!,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 262,
                    child: TabBarView(
                      children: controller.homeModelData!.shopByCategories!.map((category) {
                        return SizedBox(
                          height: 262,
                          width: Get.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: category.products!.length,
                            itemBuilder: (context, index) {
                              bool isLastItem = index == category.products!.length - 1;
                              final product = category.products![index];
                              return productView(product,isLastItem,controller);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(
                        Routes.PRODUCTLIST,
                        arguments: {
                          "categoryName": controller.homeModelData!.shopByCategoriesText!.title,
                          "categorySlag": controller.homeModelData!.shopByCategoriesText!.typeId,
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.homeModelData!.shopByCategoriesText!.bottomText,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.easternTextBlueColor,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Image.asset(
                          AssetsPath.chevronRight,
                          height: 16,
                          width: 16,
                          color: AppColor.easternTextBlueColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  homeMightAlsoLikeView(HomeController controller) {
    return SizedBox(
      height: 262,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: controller.homeModelData!.youMayAlsoLike![0].products!.length,
        itemBuilder: (context, index) {
          bool isLastItem = index == controller.homeModelData!.youMayAlsoLike![0].products!.length - 1;
          final product = controller.homeModelData!.youMayAlsoLike![0].products![index];
          return productView(product,isLastItem,controller);
        },
      ),
    );
  }

  shopByOccasions(HomeController controller) {
    return Container(
      height: 530,
      width: Get.width,
      color: AppColor.darkLightColor,
      child: DefaultTabController(
        length: controller.homeModelData!.shopByOccasions!.length,
        child: Column(
          children: [
            const SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": controller.homeModelData!.shopByOccasionText!.title,
                    "categorySlag": controller.homeModelData!.shopByOccasionText!.typeId,
                  },
                );
              },
              child: shopBy(
                bgColor: AppColor.pinkColor,
                title: controller.homeModelData!.shopByOccasionText!.title,
                subTitle: controller.homeModelData!.shopByOccasionText!.description,
                image: controller.homeModelData!.shopByOccasionText!.image,
              ),
            ),
            const SizedBox(height: 20,),
            if (controller.homeModelData!.shopByOccasions!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      tabs: controller.homeModelData!.shopByOccasions!.map((category) {
                        return Tab(
                          child: Text(
                            category.categoryName!,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 262,
                    child: TabBarView(
                      children: controller.homeModelData!.shopByOccasions!.map((category) {
                        return SizedBox(
                          height: 262,
                          width: Get.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: category.products!.length,
                            itemBuilder: (context, index) {
                              bool isLastItem = index == category.products!.length - 1;
                              final product = category.products![index];
                              return productView(product,isLastItem,controller);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(
                        Routes.PRODUCTLIST,
                        arguments: {
                          "categoryName": controller.homeModelData!.shopByOccasionText!.title,
                          "categorySlag": controller.homeModelData!.shopByOccasionText!.typeId,
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.homeModelData!.shopByOccasionText!.bottomText,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.easternTextBlueColor,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Image.asset(
                          AssetsPath.chevronRight,
                          height: 16,
                          width: 16,
                          color: AppColor.easternTextBlueColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget shopBy({
    required Color bgColor,
    required String title,
    required String subTitle,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 102,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              top: 13,
              left: 0,
              right: 0,
              child: Container(
                height: 89,
                width: Get.width,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          subTitle,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.midTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.network(
                image,
                height: 102,
                width: 102,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return const SizedBox(
                    height: 102,
                    width: 102,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  plantsForEveryVibeView(HomeController controller) {
    return SizedBox(
      height: 196,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeModelData!.plantVibes!.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.homeModelData!.plantVibes!.length - 1;
          HomeImages product = controller.homeModelData!.plantVibes![index];
          return Padding(
            padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": product.categoryName,
                    "categorySlag": product.typeId,
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 144,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
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
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.5),
                                blurRadius: 30.0,
                                spreadRadius: 0.0, //extend the shadow
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    product.categoryName,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.whiteColor,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  height: 28,
                                  width: 78,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
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
                              ],
                            ),
                          ),
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
    );
  }

  productView(Products product, bool isLastItem, HomeController controller) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                          product.productName,
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
      ),
    );
  }

  sendGiftAbroadView(HomeController controller) {
    return SizedBox(
      height: 131,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: controller.homeModelData!.internationalCategory!.length,
        itemBuilder: (context, index) {
          bool isLastItem = index == controller.homeModelData!.internationalCategory!.length - 1;
          final product = controller.homeModelData!.internationalCategory![index];
          return Padding(
            padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(
                  Routes.PRODUCTLIST,
                  arguments: {
                    "categoryName": product.categoryName,
                    "categorySlag": product.typeId,
                  },
                );
              },
              child: SizedBox(
                width: 65,
                height: 90,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.image,
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return const SizedBox(
                            height: 65,
                            width: 65,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      product.categoryName,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
    );
  }

  bottomText(HomeController controller) {
    return Container(
      height: 200,
      width: Get.width,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColor.whiteColor,
            AppColor.lightBlueColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 16,
            child: SizedBox(
              width: Get.width * .6,
              child: Column(
                children: [
                  Text(
                    controller.homeModelData!.bottomText!.title,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    controller.homeModelData!.bottomText!.description,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: Image.network(
              controller.homeModelData!.bottomText!.image,
              height: 141,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const SizedBox(
                  height: 141,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  recentViewItem(HomeController controller) {
    return SizedBox(
      height: 262,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: controller.recentView.length,
        itemBuilder: (context, index) {
          bool isLastItem = index == controller.recentView.length - 1;
          RecentData recentData =controller.recentView[index];
          return recentProductView(recentData ,isLastItem,controller);
        },
      ),
    );
  }

  recentProductView(RecentData product, bool isLastItem, HomeController controller) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.PRODUCTDETAIL,arguments: product.typeId);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: isLastItem ? 20 : 0),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                                  // Text(
                                  //   product.rating,
                                  //   style: AppStyle.textStyleOutfit(
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: AppColor.whiteColor,
                                  //   ),
                                  // ),
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
      ),
    );
  }

}
