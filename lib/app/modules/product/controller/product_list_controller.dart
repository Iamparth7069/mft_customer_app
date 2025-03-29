import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/category_model.dart';
import '../model/filter_model.dart';
import '../model/product_model.dart';
import '../screens/bottom_sheet_filter.dart';

class ProductListController extends GetxController {

  bool isLoading = false;
  bool isProductLoading = false;
  List<Category> categoryList = [];
  List<ProductsModel> productsModelList = [];
  String categoryName = "";
  String categorySlag = "";
  String sortType = "";
  String productTotal = "";
  int currentPage = 1;
  bool hasMorePages = true;
  bool isFetchingNewPage = false;
  final ScrollController scrollController = ScrollController();
  List<SortModel> sortModelList = [
    // SortModel(name: "Popularity",isSelected: true,subName: ""),
    // SortModel(name: "Low to High",isSelected: false,subName: "Low"),
    // SortModel(name: "High to Low",isSelected: false,subName: "High"),
  ];
  int selectedSortIndex = -1;

  List<FilterModel> filterModelList = [
    // FilterModel(name: "Quick Filter",isSelected: true,subFilter: [
    //   SubFilter(name: "Cartoon cake",isSelected: false),
    //   SubFilter(name: "Black forest",isSelected: false),
    //   SubFilter(name: "Truffle",isSelected: false),
    //   SubFilter(name: "Eag less",isSelected: false),
    //   SubFilter(name: "Sugar free",isSelected: false),
    //   SubFilter(name: "Fruit cake",isSelected: false),
    //   SubFilter(name: "Pinata",isSelected: false),
    //   SubFilter(name: "Bento cake",isSelected: false),
    //   SubFilter(name: "With flowers",isSelected: false),
    //   SubFilter(name: "Kiss day",isSelected: false),
    //   SubFilter(name: "Appreciation",isSelected: false),
    // ],),
    // FilterModel(name: "Price",isSelected: false,subFilter: [
    //   SubFilter(name: "Under ₹500",isSelected: false),
    //   SubFilter(name: "₹501 - ₹1000",isSelected: false),
    //   SubFilter(name: "₹1001 - ₹1500",isSelected: false),
    //   SubFilter(name: "Above ₹1500",isSelected: false),
    // ]),
  ];
  int categorySelectedIndex = 0;
  int count = 0;
  String filterValue = "";
  String filterIdGet = "";
  String price = "";

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String,dynamic> data = Get.arguments as Map<String,dynamic>;
    categoryName = data["categoryName"];
    categorySlag = data["categorySlag"];
    print("categoryName $categoryName");
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        categoryProductApi(isNextPage: true);
      }
    });
    super.onInit();
  }

  getData(){
    categoryApi();
    categoryProductApi();
    // productFilterGetApi();
  }

  categoryApi() async{
    isLoading = true;
    update();
    print(categorySlag);
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.categoryApi}?category_slug=$categorySlag",
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
          List<Category> category = (finalDecode['result']['header_banners'] as List)
              .map((categoryJson) => Category.fromJson(categoryJson))
              .toList();
          categoryList = category;
          print(categoryList.length);
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

  Future<void> categoryProductApi({bool isNextPage = false}) async {
    isProductLoading = true;
    if (isNextPage && !hasMorePages) return; // Stop if no more pages
    isFetchingNewPage = true;

    if (!isNextPage) {
      isProductLoading = true;
      currentPage = 1; // Reset to first page
      productsModelList.clear(); // Clear the existing product list
      // Do not clear filter and sort lists here
    }
    update();

    try {
      count = 0;
      filterValue = "";
      if (getSelectedQuickFilterValues().isNotEmpty) {
        print("Data Is ${getSelectedQuickFilterValues()}");
        List<String> selectedFilterValues = getSelectedQuickFilterValues();
        count = selectedFilterValues.length;
        print("Selected Filter Values: $selectedFilterValues");
        String encodeList = Uri.encodeComponent(selectedFilterValues.join(','));
        filterValue = encodeList;
      }
      if(getSelectedPriceFilterValues().isNotEmpty){
        print("Price Get  ${getSelectedPriceFilterValues()}");
        List<String> selectedPriceValues = getSelectedPriceFilterValues();
        count += selectedPriceValues.length;
        print("Count is $count");
        print("Selected Filter Values: $selectedPriceValues");
        String encodeList = Uri.encodeComponent(selectedPriceValues.join(','));
        price = encodeList;
      }
      String url = "${ApiUrl.categoryProductApi}?category_slug=$categorySlag&page=$currentPage";

      if (filterValue.isNotEmpty) {
        url += "&filter=$filterValue";
      }

      if (price.isNotEmpty) {
        url += "&price=$price";
      }

      if (sortType.isNotEmpty) {
        url += "&type=$sortType";
      }

      print(url);
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
        if (finalDecode["status"] == true) {
          List<SubFilter> priceSubFilters = [];
          List<SubFilter> filterSubCategory = [];

          for (var item in finalDecode['result']['QuickFilter']) {
            // Check if the filter already exists
            if (!filterModelList.any((filterModel) => filterModel.subFilter.any((subFilter) => subFilter.value == item['filter_id']))) {
              filterSubCategory.add(SubFilter(name: item['name'], value: item['filter_id'], isSelected: false));
            }
          }
          // Add new filter only if there are new items
          if (filterSubCategory.isNotEmpty) {
            filterModelList.add(FilterModel(name: "Quick Filter", subFilter: filterSubCategory));
          }

          for (var item in finalDecode['result']['price']) {
            // Check if the price filter already exists
            if (!filterModelList.any((filterModel) => filterModel.subFilter.any((subFilter) => subFilter.value == item['value']))) {
              priceSubFilters.add(SubFilter(name: item['name'], value: item['value'], isSelected: false));
            }
          }
          // Add new price filter only if there are new items
          if (priceSubFilters.isNotEmpty) {
            filterModelList.add(FilterModel(name: "Price", subFilter: priceSubFilters));
          }

          List<SortModel> sortBySubFilters = [];
          for (var item in finalDecode['result']['sort_by']) {
            // Check if the sort filter already exists
            if (!sortModelList.any((sortModel) => sortModel.subName == item['value'])) {
              sortBySubFilters.add(SortModel(name: item['name'], subName: item['value'], isSelected: false));
            }
          }
          sortModelList.addAll(sortBySubFilters);

          productTotal = finalDecode['result']['product_total'];
          List<ProductsModel> productsModel = (finalDecode['result']['products'] as List)
              .map((productJson) => ProductsModel.fromJson(productJson))
              .toList();
          if (productsModel.isEmpty) {
            hasMorePages = false; // No more pages if new list is empty
          } else {
            debugPrint("Category Length ${productsModel.length}");
            currentPage++; // Increment the page for the next fetch
            productsModelList.addAll(productsModel); // Append new products
          }
          print(productsModelList.length);
        } else {
          showSnackBar(message: finalDecode["result"]["error"]["category"].toString());
        }
        isProductLoading = false;
        update();
      } else {
        showSnackBar(message: getResponse.body);
        isProductLoading = false;
        update();
      }
    } catch (e) {
      isProductLoading = false;
      update();
      print("Error: $e");
    } finally {
      isProductLoading = false;
      isFetchingNewPage = false;
      update(); // Trigger UI update
    }
  }

  productFilterGetApi() async{
    isLoading = true;
    update();
    print(categorySlag);
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.categoryProductApi}?category_slug=$categorySlag",
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
          List<SubFilter> priceSubFilters = [];

          for (var item in finalDecode['result']['price']) {
            priceSubFilters.add(SubFilter(name: item['name'],value: item['value'], isSelected: false));
          }
          filterModelList.add(FilterModel(name: "Price", subFilter: priceSubFilters));

          List<SortModel> sortBySubFilters = [];
          for (var item in finalDecode['result']['sort_by']) {
            sortBySubFilters.add(SortModel(name: item['name'],subName: item['value'], isSelected: false));
          }
          sortModelList.addAll(sortBySubFilters);
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

  void sortProduct(String name) {
    sortType = name;
    categoryProductApi();
    Get.back();
  }

  void setSelectedSortIndex(int index) {
    selectedSortIndex = index;
    sortProduct(sortModelList[index].subName);
    update();
  }

  void selectFilter(int index) {
    for(int i = 0; i < filterModelList.length; i++){
      if(filterModelList[i].name == filterModelList[index].name){
        filterModelList[i].isSelected = true;
      }
      else{
        filterModelList[i].isSelected = false;
      }
    }
    categorySelectedIndex = index;
    update();
  }

  void isChecked(SubFilter selectedSubFilter) {
    selectedSubFilter.isSelected = !selectedSubFilter.isSelected;
    update();
  }

  void showBottomFilter() {
    for(int i = 0; i < filterModelList.length; i++){
      if(filterModelList[i].name == filterModelList[0].name){
        filterModelList[i].isSelected = true;
      }
      else{
        filterModelList[i].isSelected = false;
      }
    }
    categorySelectedIndex = 0;
    update();

    Get.bottomSheet(
      const BottomSheetFilter(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  List<String> getSelectedQuickFilterValues() {
    List<String> selectedQuickFilterValues = [];
    for (var filterModel in filterModelList) {
      if (filterModel.name == "Quick Filter") {
        for (var subFilter in filterModel.subFilter) {
          if (subFilter.isSelected) {
            selectedQuickFilterValues.add(subFilter.value);
          }
        }
      }
    }
    return selectedQuickFilterValues;
  }

  List<String> getSelectedPriceFilterValues() {
    List<String> selectedPriceValues = [];
    for (var filterModel in filterModelList) {
      if (filterModel.name == "Price") {
        for (var subFilter in filterModel.subFilter) {
          if (subFilter.isSelected) {
            selectedPriceValues.add(subFilter.value);
          }
        }
      }
    }
    return selectedPriceValues;
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