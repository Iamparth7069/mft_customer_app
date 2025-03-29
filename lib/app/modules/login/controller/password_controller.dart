import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';

class PasswordController extends GetxController {

  String emailOrMobile = "";
  TextEditingController passwordController = TextEditingController();
  bool isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  bool isValidMobile(String value) {
    final mobileRegex = RegExp(r'^[0-9]+$');
    return mobileRegex.hasMatch(value);
  }

  bool isLoading = false;
  bool isTextChanged = false;
  bool isTextObscure = true;
  bool isEmailLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    emailOrMobile = Get.arguments as String;
    print("emailOrMobile $emailOrMobile");
    super.onInit();
  }

  void changeText(String text) {
    if(passwordController.text.isEmpty){
      isTextChanged = false;
    }
    else{
      isTextChanged = true;
    }
    update();
  }

  void showPassword() {
    isTextObscure = !isTextObscure;
    update();
  }

  void login() async{
    isLoading = true;
    update();
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var body = {
      'email': emailOrMobile,
      'password': passwordController.text,
      'device_type': Platform.isAndroid ? "android" : "ios",
      'device_token': firebaseToken ?? "",
    };
    print(body);
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.loginApi,
        body: body,
      );
      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      print(getResponse.body);
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if(finalDecode["status"] == true){
          showSnackBar(message: finalDecode["message"]);
          preferences.setString(PrefConstantsKey.userId,finalDecode["result"]["customer_id"]);
          preferences.setString(PrefConstantsKey.userEmail,finalDecode["result"]["email"]);
          preferences.setString(PrefConstantsKey.token,finalDecode["result"]["token"]);
          Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
        }
        else{
          print("getResponse.statusCode ${finalDecode["message"]}");
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

  void checkIsEmail() {
    String emailMobile = getEmailOrMobile(emailOrMobile);
    if(emailMobile == "Email"){
      Map<String, dynamic> body = {
        'email': emailOrMobile,
      };
      sendOtpEmail(body,ApiUrl.sendOtpApi);
    }
    else if(emailMobile == "Mobile"){
      Map<String, dynamic> body = {
        'telephone': emailOrMobile,
      };
      sendOtpEmail(body,ApiUrl.sendOtpMobileApi);
      print("Mobile");
    }
    else{
      print("Invalid");
    }
  }

  void sendOtpEmail(Map<String, dynamic> body, String loginWithMobileOtpApi) async{
    isEmailLoading = true;
    update();
    print(body);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: loginWithMobileOtpApi,
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
        print(finalDecode);
        if(finalDecode["status"] == true){
          showSnackBar(message: finalDecode["message"].toString());
          Get.toNamed(Routes.MOBILEVERIFICATION,arguments: {
            "emailOrMobile": emailOrMobile,
            "isEmail": "password",
            "otp": finalDecode["result"]["otp"],
          });
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isEmailLoading = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isEmailLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isEmailLoading = false;
      update();
      print("Error: $e");
    }
  }

}
