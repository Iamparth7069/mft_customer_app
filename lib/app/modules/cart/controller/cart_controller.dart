import 'dart:developer';

import 'package:customer_app/app/modules/address/model/address_model.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';
import '../model/cart_data.dart';
import '../model/copuon.dart';
import '../model/date_time_model.dart';
import '../screens/widgets/bootom_sheet_select_address.dart';
import '../screens/widgets/bottom_sheet_order_summary.dart';
import '../screens/widgets/bottom_sheet_redeem.dart';
import '../screens/widgets/select_drop_down_list.dart';

class CartController extends GetxController {

  int currentStep = 0;
  int counter = 3;
  List list = [0,1,2,3];
  AddressModel addressModel = AddressModel(
    id: 0,
    fullName: "John Doe",
    mobile: "9879879879",
    alterNateMobile: "8989898989",
    pinCode: "395010",
    city: "Surat",
    state: "Gujarat",
    address1: "401, Marutidham society, Opp. PVR Cinema,",
    addressType: "Home",
    isDefault: true,
  );
  List<Address> addressModelList = [];
  TextEditingController coinController = TextEditingController();
  final DateTime today = DateTime.now();
  final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
  final DateTime laterDate = DateTime.now().add(const Duration(days: 30));
  String selectedDate = "Today";
  int categorySelectedIndex = 0;
  List<DateTimeModel> dateTimeModelList = [
    DateTimeModel(
      name: "Morning delivery",
      isSelected: true,
      price: "₹100",
      image: AssetsPath.icMorning,
      subTime: [
        TimeModel(name: "07:00 am - 09:00 am"),
      ],
    ),
    DateTimeModel(
      name: "Express delivery",
      price: "₹49",
      image: AssetsPath.icDelivery,
      subTime: [
        TimeModel(name: "09:00 am - 01:00 pm"),
        TimeModel(name: "12:00 pm - 03:00 pm"),
        TimeModel(name: "04:00 am - 06:00 pm"),
        TimeModel(name: "07:00 pm - 11:00 pm"),
      ],
    ),
    DateTimeModel(
      name: "Standard delivery",
      price: "₹19",
      image: AssetsPath.icStander,
      subTime: [
        TimeModel(name: "08:00 am - 12:00 pm"),
        TimeModel(name: "12:00 pm - 03:00 pm"),
        TimeModel(name: "03:00 am - 06:00 pm"),
        TimeModel(name: "06:00 pm - 11:00 pm"),
      ],
    ),
    DateTimeModel(
      name: "Fixed time",
      price: "₹99",
      image: AssetsPath.icSameDay,
      subTime: [
        TimeModel(name: "10:00 am - 11:00 pm"),
        TimeModel(name: "11:00 pm - 12:00 pm"),
        TimeModel(name: "12:00 pm - 01:00 pm"),
        TimeModel(name: "01:00 pm - 02:00 pm"),
        TimeModel(name: "02:00 pm - 03:00 pm"),
        TimeModel(name: "03:00 pm - 04:00 pm"),
        TimeModel(name: "04:00 pm - 05:00 pm"),
        TimeModel(name: "05:00 pm - 06:00 pm"),
        TimeModel(name: "06:00 pm - 07:00 pm"),
        TimeModel(name: "07:00 pm - 08:00 pm"),
        TimeModel(name: "08:00 pm - 09:00 pm"),
        TimeModel(name: "09:00 pm - 10:00 pm"),
        TimeModel(name: "10:00 pm - 11:00 pm"),
        TimeModel(name: "10:00 pm - 11:00 pm"),
        TimeModel(name: "11:00 pm - 12:00 pm"),
      ],
    ),
    DateTimeModel(
      name: "Midnight delivery",
      price: "₹250",
      image: AssetsPath.icNight,
      subTime: [
        TimeModel(name: "11:00 am - 11:59 pm"),
      ],
    ),
  ];
  List<OccasionModel> occasionModelList = [];
  String selectedOccasionValue = "Select other occasion";
  DropListModel dropListModel = DropListModel([]);
  OptionItem optionItemSelected = OptionItem(title: "Select other occasion");
  TextEditingController messageController = TextEditingController();
  TextEditingController senderNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool isHideSenderName = false;
  bool isCheckWallet = false;
  bool isShowPrice = false;
  bool isLoading = false;
  bool isOccasionSelected = false;
  String occasionString = "";
  String selectedSlotName = "Morning delivery";
  String selectedSlotTime = "";
  CartData? cartProduct;
  CoponModel? couponModel;
  String? firstName;
  String? address;
  String? postCode;
  String? city;
  String? telephone;
  String total = "Rs. 0";
  String subTotal = "Rs. 0";
  String couponDiscount = "Rs. 0";
  bool isDiscountAdded = false;

  @override
  void onInit() {
    // TODO: implement onInit
    currentStep = 0;
    getDataCart();
    getOccasions();
    getAddressList();
    super.onInit();
  }

  Future<void> getDataCart() async {
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.cartApi,
      );
      // Cart Data Call
      dynamic responseBody = response['response'];
      print(responseBody);
      int statusCode = response['statusCode'];

      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if (finalDecode["status"] == true) {
          // homeModelData = HomeModel.fromJson(finalDecode["result"]);
          cartProduct = CartData.fromJson(finalDecode);
          if(cartProduct!.result != null){
            subTotal = cartProduct!.result!.totals![0].text!;
            total = cartProduct!.result!.totals![1].text!;
          }
          getAddress();
          isLoading = false;
          update();
        } else {
          showSnackBar(message: getResponse.body["result"]["error"].toString());
          // Get.offAllNamed(Routes.LOGIN);
          isLoading = false;
          update();
        }
      } else {
        showSnackBar(message: getResponse.body);
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print("Error: $e");
    }
  }

  Future<void> getAddress() async {
    try{
      Map<String, dynamic> body = {'address_id' : '914507'};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(PrefConstantsKey.token) ?? "";
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authorization' : 'bearer $token'
      };
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.getAddress,
        headers: headers,
        body: body,
      );
      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );

      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        print("Status $finalDecode");
        if (finalDecode["status"] == true) {
          showSnackBar(message: finalDecode["message"].toString());
          print("Address Name ");
          firstName = finalDecode["result"]["address"]["firstname"];
          address = finalDecode["result"]["address"]["address"];
          postCode = finalDecode["result"]["address"]["postcode"];
          update();
        } else {
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      } else {
        showSnackBar(message: getResponse.body);
        update();
      }
    }catch(e){
      update();
      print("Error: $e");
    }
  }

  getOccasions() async{
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.getShipping,
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
          final occasions = finalDecode['result']['occasions'];
          final mainOccasions = occasions['main_occasions'] as List;
          final otherOccasions = occasions['other_occasions'] as List;

          // Add main occasions
          for (String occasion in mainOccasions) {
            occasionModelList.add(OccasionModel(name: occasion));
          }

          List<OptionItem> otherOccasionsList = otherOccasions.asMap().entries.map((entry) {
            int index = entry.key;
            String title = entry.value;
            return OptionItem(id: (index + 7).toString(), title: title);
          }).toList();
          dropListModel = DropListModel(otherOccasionsList);
          // Add other occasions
          // for (String occasion in otherOccasions) {
          //   dropListModel.add(DropListModel(id: idCounter.toString(), title: occasion));
          //   idCounter++;
          // }

        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
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
    finally {
      isLoading = false;
      update();
    }
  }

  void getAddressList() async{
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
          addressModelList = (finalDecode['result']['adressess'] as List)
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

  void nextStep() {
    if(currentStep == 1){
      if(selectedSlotTime == ""){
        showSnackBar(message: "Please select slot time.");
      }
      else{
        slotUpdateApi();
      }
    }
    else if(currentStep == 2){
      if(optionItemSelected == OptionItem(title: "Select other occasion") && !isOccasionSelected){
        showSnackBar(message: "Please select occasion.");
      }
      else{
        setOccasionApi();
      }
    }
    else if(currentStep == 3){
      Get.offAllNamed(Routes.DASHBOARD);
    }
    else{
      currentStep ++;
    }
    update();
  }

  void increaseQuantity(Products product) async{
    int convert = int.parse(product.quantity!);
    convert++;
    product.quantity = convert.toString();
    await updateProductDataApi(product);
    update();
  }

  void decreaseQuantity(Products product) async{
    int convert = int.parse(product.quantity!);
    if (convert > 1) {
      convert--;
      product.quantity = convert.toString();
      await updateProductDataApi(product);
      update();
    }
    else{
      deleteProduct(product);
    }
  }

  Future<void> deleteProduct(Products product) async {
    // cartData.remove(product);
    Map<String, dynamic> body = {'cart_id': product.cartId, 'key': product.key};

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(PrefConstantsKey.token) ?? "";

    print("cart Id ${product.cartId}");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    // Add authorization header only if token is not null
    headers['authorization'] = "bearer $token";
      Map<String, dynamic> response = await NetworkService.makePostRequest(
      url: ApiUrl.cartDelete,
      headers: headers,
      body: body,
    );

    dynamic responseBody = response['response'];
    int statusCode = response['statusCode'];
    Response getResponse = Response(
      body: responseBody,
      statusCode: statusCode,
    );

    if (getResponse.statusCode == 200) {
      var finalDecode = getResponse.body;
      print("Status $finalDecode");
      if (finalDecode["status"] == true) {
        showSnackBar(message: finalDecode["message"].toString());
        cartProduct = CartData.fromJson(finalDecode);
        subTotal = finalDecode["result"]["totals"][0]["text"];
        total = finalDecode["result"]["totals"][1]["text"];
        isDiscountAdded = false;
      } else {
        showSnackBar(message: finalDecode["message"].toString());
      }
      isLoading = false;
      update();
    } else {
      showSnackBar(message: getResponse.body);
      isLoading = false;
      update();
    }
  }

  Future<void> applyCoupon() async {
    Map<String, dynamic> body = {'coupon': "detest"};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(PrefConstantsKey.token) ?? "";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      headers['authorization'] = "bearer $token";
          Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.applyCoupon,
        headers: headers,
        body: body,
      );
      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        print("Status ${finalDecode["result"]}");
        if (finalDecode["status"] == true) {
          showSnackBar(message: finalDecode["message"].toString());
          subTotal = finalDecode["result"]["totals"][0]["text"];
          couponDiscount = finalDecode["result"]["totals"][1]["text"];
          total = finalDecode["result"]["totals"][2]["text"];
          isDiscountAdded = true;
        } else {
          showSnackBar(message: finalDecode["message"].toString());
        }
        isLoading = false;
        update();
      } else {
        showSnackBar(message: getResponse.body);
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print("Error: $e");
    }
  }

  Future<void> removeCoupon() async {
    Map<String, dynamic> body = {'coupon': "detest"};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(PrefConstantsKey.token) ?? "";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      headers['authorization'] = "bearer $token";
          Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.couponRemove,
        headers: headers,
        body: body,
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
          showSnackBar(message: finalDecode["message"].toString());
          // couponModel = CoponModel.fromJson(finalDecode);
          subTotal = finalDecode["result"]["totals"][0]["text"];
          couponDiscount = "--";
          total = finalDecode["result"]["totals"][1]["text"];
          isDiscountAdded = false;
        } else {
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      } else {
        showSnackBar(message: getResponse.body);

        update();
      }
    } catch (e) {

      update();
      print("Error: $e");
    }
  }

  void changeAddress() {
    Get.bottomSheet(
      const BottomSheetSelectAddress(),
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  void selectAddress(Address address) {
    for (var addr in addressModelList) {
      addr.isSelected = false;
    }
    address.isSelected = true;
    update();
  }

  void deliverHere(Address address) {
    for (var addr in addressModelList) {
      addr.isDefault = "0";
    }
    address.isDefault = "1";
    update();
  }

  void redeem() {
    Get.bottomSheet(
      const BottomSheetRedeem(),
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  void selectDate(String formattedDate) {
    if (formattedDate == "Today") {
      selectedDate = "Today";
    } else if (formattedDate == "Tomorrow") {
      selectedDate = "Tomorrow";
    } else {
      selectedDate = "Later";
    }
    update();
  }

  String formatDate(DateTime date) {
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    int day = date.day;
    String month = months[date.month - 1]; // Get month name
    return '$day $month';
  }

  void selectDateTime(int index) {
    for(int i = 0; i < dateTimeModelList.length; i++){
      if(dateTimeModelList[i].name == dateTimeModelList[index].name){
        dateTimeModelList[i].isSelected = true;
        selectedSlotName = dateTimeModelList[i].name;
      }
      else{
        dateTimeModelList[i].isSelected = false;
      }
    }
    categorySelectedIndex = index;
    update();
  }

  void isChecked(TimeModel selectedSubFilter) {
    for (var dateTimeModel in dateTimeModelList) {
      for (var subFilter in dateTimeModel.subTime) {
        subFilter.isSelected = false;
      }
    }
    List<TimeModel> subFilters = dateTimeModelList[categorySelectedIndex].subTime;
    for (var subFilter in subFilters) {
      if (subFilter == selectedSubFilter) {
        subFilter.isSelected = true;
        selectedSlotTime = subFilter.name;
      }
    }
    update();
  }

  void selectOccasion(OccasionModel occasion) {
    for (var occasionModel in occasionModelList) {
      if(occasionModel.isSelected == true){
        occasionModel.isSelected = false;
        isOccasionSelected = false;
        occasionString = "";
      }
      else{
        occasionModel.isSelected = occasionModel == occasion;
        isOccasionSelected = occasion.isSelected;
        occasionString = occasion.name;
      }
    }
    print(occasionString);
    update();
  }

  void onOptionSelected(OptionItem optionItem) {
    optionItemSelected = optionItem;
    update();
  }

  void hideSenderName() {
    isHideSenderName = !isHideSenderName;
    update();
  }

  void isCheckedWallet() {
    isCheckWallet = !isCheckWallet;
    if(isCheckWallet){
    }
    else{
      isShowPrice = false;
    }
    update();
  }

  void showPrice() {
    isShowPrice = !isShowPrice;
    update();
  }

  void orderSummary() {
    Get.bottomSheet(
      const BottomSheetOrderSummary(),
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  Future slotUpdateApi() async{
    Map<String, dynamic> body = {
      'shipping_name': selectedSlotName,
      'shipping_time_slot': selectedSlotTime,
      'delivery_date': selectedDate,
    };
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.slotUpdate,
        body: body,
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      if (statusCode == 200) {
        if (responseBody is Map<String, dynamic>) {
          print("responseBody ${responseBody.runtimeType}");
          if (responseBody["status"] == true) {
            print(responseBody['result'].runtimeType);
            var result = responseBody['result'] as Map<String, dynamic>;
            var totals = result['totals'] as List<dynamic>;
            subTotal = totals[0]["text"];
            total = totals[1]["text"];
            currentStep ++;
            update();
            log(result.toString());
          } else {
            showSnackBar(message: responseBody["message"].toString());
          }
        }
      }

      // if (getResponse.statusCode == 200) {
      //   var finalDecode = getResponse.body;
      //   log(finalDecode);
      //   if(finalDecode["status"] == true){
      //     print(finalDecode);
      //   }
      //   else{
      //     showSnackBar(message: finalDecode["message"].toString());
      //   }
      //   update();
      // }
      // else {
      //   showSnackBar(message: getResponse.body);
      //   update();
      // }
      // ignore: non_constant_identifier_names
    } catch (e) {
      update();
      print("Error: $e");
    }
  }

  Future setOccasionApi() async{
    Map<String, dynamic> body = {
      'occasiontype': isOccasionSelected == true ? occasionString : optionItemSelected.title,
      'messageoncake': "820621",
      'cardMessage': messageController.text,
      'order_id': selectedDate,
      'sender_name': senderNameController.text,
    };
    print("body $body");
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.setShipping,
        body: body,
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
          currentStep ++;
          print(finalDecode);
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      update();
      print("Error: $e");
    }
  }

  Future<void> updateProductDataApi(Products product) async {
    try{

      Map<String,String> body = {
        'cart_id' : product.cartId!,
        'quantity' : product.quantity!
      };
      Map<String, dynamic> response = await NetworkService.makePostRequest(
          url: ApiUrl.cartUpdate,
          body: body,
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
          cartProduct = CartData.fromJson(finalDecode);
          total = cartProduct!.result!.totals![1].text!;
          subTotal = cartProduct!.result!.totals![0].text!;
          update();
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      }else {
        showSnackBar(message: getResponse.body);
        update();
      }

    }catch(e){
      update();
      print("Error: $e");
    }

  }

  Future payNow() async{
    // Map<String, dynamic> body = {
    //   'occasiontype': isOccasionSelected == true ? occasionString : optionItemSelected.title,
    //   'messageoncake': "820621",
    //   'cardMessage': messageController.text,
    //   'order_id': selectedDate,
    //   'sender_name': senderNameController.text,
    // };
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.walletPay,
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
          Get.toNamed(Routes.ORDERSUCCESS);
          print(finalDecode);
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      update();
      print("Error: $e");
    }
  }

}

