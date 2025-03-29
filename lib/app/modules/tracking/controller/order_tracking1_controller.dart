import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/order_track_data.dart';

class OrderTracking1Controller extends GetxController{
  final double userRating = 0.0;
  final bool isVertical = false;
  bool isExpanded1 = false;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>(); // Key for the form
  bool isFormValid = false; // Tracks overall form validity
  bool showContent = false;
  OrderDetails? orderDetails;
  bool isTextNotEmpty = false; // Tracks if orderId text is not empty

  void validateForm() {
    isTextNotEmpty = searchController.text.isNotEmpty;
    isFormValid = formKey.currentState?.validate() ?? false;
    update();
  }

  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit

    // searchController.addListener(validateForm);
    // emailController.addListener(validateForm);
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void clear() {
    searchController.clear();
    // validateForm();
  }

  showData() {
    showContent = true;
    update();
    // if(isFormValid){
    //   showContent = true;
    //   update();
    // }else{
    //   showContent = false;
    //   update();
    // }
  }

  Future<void> getData() async {
    isLoading = true;
    update();
    String id = searchController.text.toString();
    Map<String, dynamic> response = await NetworkService.makeGetRequest(
      url: ApiUrl.trackOrder + id,
    );
    dynamic responseBody = response['response'];
    print(responseBody);
    int statusCode = response['statusCode'];
    Response getResponse = Response(
      body: responseBody,
      statusCode: statusCode,
    );

    try{
      if (getResponse.statusCode == 200) {
        // var finalDecode = getResponse.body;
        // orderDetails = OrderDetails.fromJson(finalDecode);
        print("order Details ${orderDetails!.result.express.products.length}");
        isLoading = false;
        update();
      }

    }catch(e){
      isLoading = false;
      update();
      print("Error: $e");
    }
  }

}