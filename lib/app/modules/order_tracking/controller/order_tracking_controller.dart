import 'package:get/get.dart';

import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';

class OrderTrackingController extends GetxController{
  final double userRating = 0.0;
  bool isExpanded1 = false;
  String orderId = "";
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    final orderid = arguments['OrderId'];
    orderId = orderid;
    print("Order ID $orderId");
    getData();
  }

  Future<void> getData() async {
    try{
      isLoading = true;
      update();
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.orders,
      );
      dynamic responseBody = response['response'];
      print(responseBody);
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        // var finalDecode = getResponse.body;
        // orderDetails = OrderDetails.fromJson(finalDecode);
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