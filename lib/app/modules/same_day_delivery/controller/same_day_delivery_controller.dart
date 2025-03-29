import 'package:customer_app/app/modules/same_day_delivery/screens/bottom_sheet_sort_sam_day_delivery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../category/model/category_model.dart';
import '../../product/model/category_model.dart';
import '../../product/model/filter_model.dart';
import '../../product/model/product_model.dart';

class SameDayDeliveryController extends GetxController with GetSingleTickerProviderStateMixin{

  bool isLoading = false;
  bool isProductLoading = false;
  List<Category> categoryList = [];
  List<ProductsModel> productsModelList = [];
  String categoryName = "same-day-delivery";
  String sortType = "";
  String productTotal = "";
  int currentPage = 1;
  bool hasMorePages = true;
  bool isFetchingNewPage = false;
  final ScrollController scrollController = ScrollController();
  Categories? categoryModel;
  late TabController tabController;
  List<SortModel> sortModelList = [
    SortModel(name: "Popularity",isSelected: true,subName: ""),
    SortModel(name: "Low to High",isSelected: false,subName: "Low"),
    SortModel(name: "High to Low",isSelected: false,subName: "High"),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    categoryApi();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        categoryProductApi(isNextPage: true);
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  void categoryApi() async{
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.category,
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if(finalDecode["status"] == true){
          categoryModel = Categories.fromJson(finalDecode['result']['categories']);
          tabController = TabController(
            length: categoryModel!.giftType[0].subCategories!.length,
            vsync: this,
          );
          categoryName = categoryModel!.giftType[0].subCategories![0].typeId!;
          categoryProductApi();
          isLoading = false;
          update();
        }
        else {
          showSnackBar(message: getResponse.body["result"]["error"].toString());
          isLoading = false;
          update();
        }
      }
      else {
        showSnackBar(message: getResponse.body);
        isLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isLoading = false;
      update();
      print("Error: $e");
    }
  }

  void categoryProductApi({bool isNextPage = false}) async{
    if (isNextPage && !hasMorePages) return; // Stop if no more pages
    isProductLoading = true;
    if (!isNextPage) {
      print('isNextPage $isNextPage');
      isFetchingNewPage = false;
      currentPage = 1; // Reset to first page
      productsModelList.clear(); // Clear the existing list
    }
    else{
      isFetchingNewPage = true;
    }
    update();

    try {
      String url = "";
      if(sortType == ""){
        url = "${ApiUrl.categoryProductApi}?category_slug=$categoryName&page=$currentPage";
      }
      else{
        url = "${ApiUrl.categoryProductApi}?category_slug=$categoryName&page=$currentPage&type=$sortType";
      }
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: url,
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if(finalDecode["status"] == true){
          productTotal = finalDecode['result']['product_total'];
          List<ProductsModel> productsModel = (finalDecode['result']['products'] as List)
              .map((productJson) => ProductsModel.fromJson(productJson))
              .toList();
          if (productsModel.isEmpty) {
            hasMorePages = false; // No more pages if new list is empty
          } else {
            currentPage++; // Increment the page for the next fetch
            productsModelList.addAll(productsModel); // Append new products
          }
          print(productsModelList.length);
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isProductLoading = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isProductLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isProductLoading = false;
      update();
      print("Error: $e");
    }
    finally {
      isProductLoading = false;
      isFetchingNewPage = false;
      update(); // Trigger UI update
    }
  }

  void selectCategory(int index) {
    tabController.index = index;
    categoryName = categoryModel!.giftType[0].subCategories![index].typeId!;
    sortType = "";
    categoryProductApi();
    update();
  }

  void showBottomSheet() {
    print("object");
    Get.bottomSheet(
      const BottomSheetSortSameDayDelivery(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  void sortProduct(String name) {
    sortType = name;
    update();
    categoryProductApi();
    Get.back();
  }

  void addOrRemoveWishList(String productId, String wishListProduct) async{
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: wishListProduct.isEmpty ? ApiUrl.addWishList : ApiUrl.removeWishList,
        body: {
          "product_id": productId,
        },
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if(finalDecode["status"] == true){
          categoryProductApi();
          showSnackBar(message: finalDecode["message"].toString());
        }
        else{
          showSnackBar(message: finalDecode["result"]["error"]["category"].toString());
        }
        isLoading = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isLoading = false;
      update();
      print("Error: $e");
    }
  }

}