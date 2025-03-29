import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/address_model.dart';

class DeliveryAddressController extends GetxController {
  List<Address> addressList = [];
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    getAddress();
    super.onInit();
  }

  void getAddress() async{
    isLoading = true;
    update();
    try {

      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.getAddresses,
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
          addressList = (finalDecode['result']['adressess'] as List)
              .map((addressJson) => Address.fromJson(addressJson))
              .toList();
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

  void deleteAddress(String? addressId) async{
    isLoading = true;
    update();
    try {

      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.deleteAddress,
        body: {
          "address_id": addressId,
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
        print(finalDecode);
        if(finalDecode["status"] == true){
          getAddress();
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
