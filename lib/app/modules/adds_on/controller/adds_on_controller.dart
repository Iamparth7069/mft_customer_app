import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/adds_on_model.dart';

class AddsOnController extends GetxController {

  AddsOnModel? addsOnModel;
  final ScrollController scrollController = ScrollController();
  final double expandedHeight = 400.0;
  bool isTitleSticky = false;
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool showBtn = false;
  bool isLastPage = false;
  int productId = 0;
  String sesskey = "";

  @override
  void onInit() {
    // TODO: implement onInit
    final Map<String, dynamic> args = Get.arguments;
    productId = args["productId"];
    sesskey = args["sesKey"];
    getData();
    super.onInit();
  }

  void getData() async{
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.buyNow,
        body: {
          "product_id": productId,
          "options": [],
        }
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
          addsOnModel = AddsOnModel.fromJson(finalDecode["result"]);
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

  void addRemove(Data product) {
    if (product.isAdded) {
      product.isAdded = false;
    } else {
      product.isAdded = true;
    }
    addRemoveApi(product);
    update();
  }

  void addRemoveApi(Data product) async{
    isLoading = true;
    update();
    try {
      print({
        "product_id": productId,
        "addon_product_id": product.productId,
        "addon_quantity": 1,
        "sesskey": sesskey,
      });

      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.addonAddToCart + sesskey,
        body: {
          "product_id": productId,
          "addon_product_id": product.productId,
          "addon_quantity": 1,
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
        print(finalDecode);
        if(finalDecode["status"] == true){
          // addsOnModel = AddsOnModel.fromJson(finalDecode["result"]);
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


}
