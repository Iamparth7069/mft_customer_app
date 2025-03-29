import 'dart:io';

import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';
import '../model/gender_model.dart';

class RegistrationController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  bool isValidMobile(String value) {
    final mobileRegex = RegExp(r'^[0-9]+$');
    return mobileRegex.hasMatch(value);
  }
  String gender = "Male";
  bool isLoading = false;
  bool isTextObscure = true;
  bool isEmail = false;
  bool isEmailMobile = false;
  bool isMobile = false;
  String email = '';
  List<GenderModel> genderModel = [
    GenderModel(name: AppText.male, image: AssetsPath.maleIcon,isSelected: true),
    GenderModel(name: AppText.female, image: AssetsPath.femaleIcon),
    GenderModel(name: AppText.other, image: AssetsPath.otherIcon),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String,dynamic> data = Get.arguments as Map<String,dynamic>;
    email = data["emailOrMobile"];
    isEmailMobile = data["isEmail"];

    isEmail = isValidEmail(email);
    if(isEmail){
      emailController.text = email;
    }
    isMobile = isValidMobile(email);
    if(isMobile){
      mobileNumberController.text = email;
    }
    super.onInit();
  }

  void register() async{
    if(fullNameController.text.isEmpty){
      showSnackBar(message: "Please enter Full Name");
    }
    else if(emailController.text.isEmpty){
      showSnackBar(message: "Please enter Email");
    }
    else if(mobileNumberController.text.isEmpty){
      showSnackBar(message: "Please enter Mobile Number");
    }
    else if(passwordController.text.isEmpty){
      showSnackBar(message: "Please enter Password");
    }
    else{
      registerApi();
    }
    // if (isEmailMobile) {
    //   Get.toNamed(Routes.MOBILEVERIFICATION,arguments: {
    //     "emailOrMobile": mobileNumberController.text,
    //     "isEmail": "mobile",
    //   });
    // }
    // else{
    //   Get.toNamed(Routes.VERIFYEMAIL,arguments: {
    //     "emailOrMobile": mobileNumberController.text,
    //     "isEmail": false,
    //   });
    // }
  }

  void showPassword() {
    isTextObscure = !isTextObscure;
    update();
  }

  void selectGender(int index) {
    for (var element in genderModel) {
      element.isSelected = (genderModel.indexOf(element) == index);
    }
    gender = genderModel[index].name;
    print("gender $gender");
    update();
  }

  void registerApi() async{
    isLoading = true;
    update();
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Map<String, dynamic> body = {
      'email': emailController.text,
      'password': passwordController.text,
      'mobile': mobileNumberController.text,
      'name': fullNameController.text,
      'gender': gender,
      'device_type': Platform.isAndroid ? "android" : "ios",
      'device_token': firebaseToken ?? "",
    };
    print(ApiUrl.registerApi);
    print(body);
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.registerApi,
        headers: headers,
        body: body,
      );
      print("response $response");
      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      print(getResponse.body);
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        print("finalDecode $finalDecode");
        if(finalDecode["status"] == true){
          showSnackBar(message: finalDecode["message"]);
          Get.toNamed(Routes.MOBILEVERIFICATION,arguments: {
            "emailOrMobile": mobileNumberController.text,
            "isEmail": "email",
            "otp": finalDecode["result"]["otp"],
          });
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
  }

}
