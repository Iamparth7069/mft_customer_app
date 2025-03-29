import 'package:customer_app/app/modules/category/controller/category_controller.dart';
import 'package:customer_app/app/modules/home/controller/home_controller.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/pref_keys.dart';
import '../../../../theme/app_style.dart';
import '../controller/delivery_cities_controller.dart';

class DeliveryCitiesScreen extends StatelessWidget {
  const DeliveryCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
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
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: backButton(),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: GetBuilder<DeliveryCitiesController>(
                        init: DeliveryCitiesController(),
                        builder: (controller) {
                          return TextFormField(
                            controller: controller.searchController,
                            textInputAction: TextInputAction.search,
                            cursorColor: AppColor.mainTextColor,
                            onChanged: (val){
                              controller.searchCity(val);
                            },
                            textAlign: TextAlign.left,
                            style: AppStyle.textStyleOutfit(
                              color: AppColor.mainTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(top: 12),
                              border: InputBorder.none,
                              hintText: AppText.selectLocation,
                              hintStyle: AppStyle.textStyleOutfit(
                                color: AppColor.midTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Image.asset(
                                  AssetsPath.location,
                                  width: 14,
                                  height: 18,
                                  color: AppColor.greyLightIconColor,
                                ),
                              ),
                              suffixIcon: SizedBox(
                                  width: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15,left: 25),
                                    child: Row(
                                      children: [
                                      if(controller.searchController.text.isNotEmpty)
                                        InkWell(
                                          onTap: (){
                                            controller.searchController.clear();
                                            controller.cityList.clear();
                                            controller.update();
                                              // searchProvider.cleanSearchProduct(notify: true);
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
                                ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<DeliveryCitiesController>(
              init: DeliveryCitiesController(),
              builder: (controller) {
                return controller.isLoading ? SizedBox(
                  height: Get.height / 2,
                  child: loader(),
                ) : Expanded(
                  child: SingleChildScrollView(
                    child: controller.cityList.isEmpty ? Column(
                      children: [
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: heading(
                            title: AppText.popularCities,
                            isShow: false,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        popularCitiesView(controller),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: heading(
                            title: AppText.allCities,
                            isShow: false,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        allCitiesView(controller),
                      ],
                    ) : searchCitiesView(controller),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  popularCitiesView(DeliveryCitiesController controller) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.topCityList.length,
        itemBuilder: (context,index){
          bool isLastItem = index == controller.topCityList.length - 1;

          return Padding(
            padding: EdgeInsets.only(left: 20, right: isLastItem ? 20 : 0),
            child: GestureDetector(
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(PrefConstantsKey.selectedCity, controller.topCityList[index].name);
                final HomeController homeController = Get.put(HomeController());
                final CategoryController categoryController = Get.put(CategoryController());
                homeController.selectedCity = controller.topCityList[index].name;
                categoryController.selectedCity = controller.topCityList[index].name;
                homeController.update();
                categoryController.update();
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 80,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        controller.topCityList[index].image,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return const SizedBox(
                            height: 60,
                            width: 60,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 7,),
                    Text(
                      controller.topCityList[index].name,
                      style: AppStyle.textStyleOutfit(
                        fontSize: 14,
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
    );
  }

  allCitiesView(DeliveryCitiesController controller) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.deliveryCityList.length,
      itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(PrefConstantsKey.selectedCity, controller.deliveryCityList[index].name);
              final HomeController homeController = Get.put(HomeController());
              final CategoryController categoryController = Get.put(CategoryController());
              homeController.selectedCity = controller.topCityList[index].name;
              categoryController.selectedCity = controller.topCityList[index].name;
              homeController.update();
              categoryController.update();
              Get.back();
            },
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Image.asset(
                  AssetsPath.location,
                  width: 14,
                  height: 18,
                  color: AppColor.mainTextColor,
                ),
                const SizedBox(width: 10,),
                Text(
                  controller.deliveryCityList[index].name,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
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
    );
  }

  searchCitiesView(DeliveryCitiesController controller) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 30),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.cityList.length,
      itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(PrefConstantsKey.selectedCity, controller.cityList[index].name);
              final HomeController homeController = Get.find();
              homeController.selectedCity = controller.cityList[index].name;
              homeController.update();
              Get.back();
            },
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Image.asset(
                  AssetsPath.location,
                  width: 14,
                  height: 18,
                  color: AppColor.mainTextColor,
                ),
                const SizedBox(width: 10,),
                Text(
                  controller.cityList[index].name,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
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
    );
  }

}
