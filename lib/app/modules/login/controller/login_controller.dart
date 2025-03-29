import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {

  TextEditingController emailMobileController = TextEditingController();
  bool isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
  bool isEmailValid = true;
  final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',);
  bool isValidMobile(String value) {
    final mobileRegex = RegExp(r'^[0-9]+$');
    return mobileRegex.hasMatch(value);
  }
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isLoading = false;
  bool isGoogleLoading = false;
  bool isTextChanged = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void validateEmail() {
    isEmailValid = isValidEmail(emailMobileController.text);
    // login();
    // if(isEmailValid){
    checkCustomer();
    // }
    update();
  }

  void checkCustomer() async{
    isLoading = true;
    update();

    var body = {
      'email': emailMobileController.text,
    };
    print(ApiUrl.checkCustomerApi);
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.checkCustomerApi,
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
          if(finalDecode["result"]["email"] == emailMobileController.text){
            Get.toNamed(Routes.PASSWORD,arguments: emailMobileController.text);
          }
          else{
            Get.toNamed(Routes.PASSWORD,arguments: emailMobileController.text);
          }
        }
        else{
          Get.toNamed(Routes.REGISTRATION,arguments: {
            "emailOrMobile": emailMobileController.text,
            "isEmail": false,
          });
          // sendOtp();
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

  void login() async{
    final String input = emailMobileController.text.trim();
    print(input);
    if (isValidEmail(input)) {
      Get.toNamed(Routes.VERIFYEMAIL,arguments: {
        "emailOrMobile": input,
        "isEmail": true,
      });
      // Navigate to the email screen
    } else if (isValidMobile(input)) {
      Get.toNamed(Routes.MOBILEVERIFICATION,arguments: {
        "emailOrMobile": input,
        "isEmail": "email",
      });
      // Navigate to mobile screen
    } else {
      Get.toNamed(Routes.PASSWORD,arguments: input);
    }
    update();
  }

  void loginApi() async{
    isLoading = true;
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'email': emailMobileController.text,
    };
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.baseUrl,
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
        if(finalDecode["status"] == true){
          preferences.setInt(PrefConstantsKey.userId,finalDecode["data"]["user_id"]);
          preferences.setString(PrefConstantsKey.userEmail,finalDecode["data"]["email"]);
          showSnackBar(message: "Login Successful");
          Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
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
      print("Error: $e");
    }
  }

  void changeText(String text) {
    if(emailMobileController.text.isEmpty){
      isTextChanged = false;
    }
    else{
      isTextChanged = true;
    }
    update();
  }

  void sendOtp() async{
    isLoading = true;
    update();
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'email': emailMobileController.text,
    };
    print(ApiUrl.sendOtpApi);
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.sendOtpApi,
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

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? response = await _googleSignIn.signIn();
      print("response $response");
      if (response != null) {
        await googleLoginApi(response);
      }
    } catch (error) {
      print("error $error");
      showSnackBar(message: error.toString());
    }
  }

  Future googleLoginApi(GoogleSignInAccount googleAuth) async{
    isGoogleLoading = true;
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? firebaseToken = await FirebaseMessaging.instance.getToken();

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'email': googleAuth.email,
      'social_id': googleAuth.id,
      'first_name': googleAuth.displayName ?? "",
      'device_type': Platform.isAndroid ? "android" : "ios",
      'device_token': firebaseToken ?? "",
    };
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.socialLoginApi,
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
        if(finalDecode["status"] == true){
          print(finalDecode);
          preferences.setString(PrefConstantsKey.userId,finalDecode["result"]["customer_id"]);
          preferences.setString(PrefConstantsKey.userEmail,finalDecode["result"]["email"]);
          preferences.setString(PrefConstantsKey.token,finalDecode["result"]["token"]);
          showSnackBar(message: "Login Successful");
          Get.offAllNamed(Routes.DASHBOARD,arguments: 0);
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isGoogleLoading = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isGoogleLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isGoogleLoading = false;
      update();
      print("Error: $e");
    }
  }

}
