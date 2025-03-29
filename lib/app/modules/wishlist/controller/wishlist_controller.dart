import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/wishlist_model.dart';

class WishListController extends GetxController {
  bool isLoading = false;
  List<WishList> wishList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async{
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.wishList,
      );

      dynamic responseBody = response['response'];
      print(responseBody);
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        print("finalDecode $finalDecode");
        // if(finalDecode["status"] == true){
        List wishListModel = finalDecode["result"]["wishlist"];
        wishList = wishListModel.map((e) => WishList.fromJson(e)).toList();
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

  void removeWishList(String productId) async{
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.removeWishList,
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
          getData();
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

  Future<void> moveToCart(String productId) async {
    Map<String, dynamic> response = await NetworkService.makePostRequest(
      url: ApiUrl.addToCart,
      body: {
        "product_id": productId,
        "Option" : [].toString()
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
        removeWishList(productId);
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
  }

}