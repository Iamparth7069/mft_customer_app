import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/address_model.dart';

class EditAddressController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController alternateMobileNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressLineController1 = TextEditingController();
  TextEditingController addressLineController2 = TextEditingController();
  bool isCheck = false;
  bool isLoaded = false;
  String selectedAddressType = "Home";
  String cityId = "";
  List<AddressType> addressType = [
    AddressType(name: "Home",isSelected: true),
    AddressType(name: "Office",isSelected: false),
  ];
  String id = "";

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() {
    Address addressModel = Get.arguments as Address;
    id = addressModel.addressId ?? "";
    fullNameController.text = addressModel.firstname ?? "";
    mobileNumberController.text = addressModel.telephone ?? "";
    alternateMobileNumberController.text = addressModel.alternateTelephone ?? "";
    pinCodeController.text = addressModel.postcode ?? "";
    cityController.text = addressModel.city ?? "";
    cityId = addressModel.cityId ?? "";
    stateController.text = "";
    addressLineController1.text = addressModel.address1 ?? "";
    addressLineController2.text = "";
    print("addressModel.isDefault ${addressModel.isDefault}");
    isCheck = addressModel.isDefault == "1" ? true : false;
    selectedAddressType = addressModel.addressType ?? "Home";
    for (int i = 0; i < addressType.length; i++) {
      if(selectedAddressType == addressType[i].name){
        addressType[i].isSelected = true;
      }
      else{
        addressType[i].isSelected = false;
      }
    }
  }

  void isChecked() {
    isCheck = !isCheck;
    update();
  }

  void selectAddressType(int index) {
    for (int i = 0; i < addressType.length; i++) {
      addressType[i].isSelected = i == index;
      if (i == index) {
        selectedAddressType = addressType[i].name;
      }
    }
    print("selectedAddressType $selectedAddressType");
    update();
  }

  void editAddress() {
    if(fullNameController.text.isEmpty){
      showSnackBar(message: "Please Enter full name");
    }
    else if(mobileNumberController.text.isEmpty){
      showSnackBar(message: "Please Enter mobile number");
    }
    else if(pinCodeController.text.isEmpty){
      showSnackBar(message: "Please Enter Your pin code");
    }
    else if(cityController.text.isEmpty){
      showSnackBar(message: "Please Enter Your City");
    }
    else if(addressLineController1.text.isEmpty){
      showSnackBar(message: "Please Enter Your Address");
    }
    else{
      editAddressApi();
    }
  }

  void fetchPinCodeDetails(String value) async{
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.pinCodeCity,
        body: {
          "pincode": value,
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
        print("finalDecode $finalDecode");
        if(finalDecode["status"] == true){
          pinCodeController.text = finalDecode["result"]["pincode"];
          cityController.text = finalDecode["result"]["city_name"];
          stateController.text = finalDecode["result"]["state"];
        }
        else{
          showSnackBar(message: finalDecode["result"]["error"]["category"].toString());
        }
      }
      else {
        showSnackBar(message: getResponse.body);
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      print("Error: $e");
    }
  }

  void editAddressApi() async{
    try {
      isLoaded = true;
      update();

      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.addAddress,
        body: {
          'name': fullNameController.text,
          'pincode': pinCodeController.text,
          'city_name': cityController.text,
          'city_id': cityId,
          'addresstype': selectedAddressType,
          'address': addressLineController1.text,
          'mobile': mobileNumberController.text,
          'default_address': isCheck ? 1 : 0,
          'address2': addressLineController2.text,
          'alternate_telephone': alternateMobileNumberController.text,
          'address_id': id,
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
        print("finalDecode $finalDecode");
        if(finalDecode["status"] == true){
          Get.back(result: true);
        }
        else{
          showSnackBar(message: finalDecode["result"]["error"]["category"].toString());
        }
        isLoaded = false;
        update();
      }
      else {
        isLoaded = false;
        update();
        showSnackBar(message: getResponse.body);
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isLoaded = false;
      update();
      print("Error: $e");
    }
  }

}
