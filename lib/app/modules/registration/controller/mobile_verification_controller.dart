import 'dart:async';
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

class MobileVerificationController extends GetxController {

  TextEditingController codeController = TextEditingController();
  bool isLoading = false;
  bool isTextChanged = false;
  String mobileNumber = "";
  int secondsRemaining = 30;
  Timer? _timer;
  String isEmail = "false";
  int otp = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String,dynamic> data = Get.arguments as Map<String,dynamic>;
    mobileNumber = data["emailOrMobile"];
    isEmail = data["isEmail"].toString();
    otp = data["otp"];
    print(otp);
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    secondsRemaining = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        update();
      } else {
        _timer?.cancel();
      }
    });
    update();
  }

  void reStartTimer() {
    _timer?.cancel(); // Cancel any existing timer
    secondsRemaining = 30;
    checkIsEmail();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        update();
      } else {
        _timer?.cancel();
      }
    });
    update();
  }

  void checkIsEmail() {
    String emailMobile = getEmailOrMobile(mobileNumber);
    if(emailMobile == "Email"){
      Map<String, dynamic> body = {
        'email': mobileNumber,
      };
      sendOtpEmail(body,ApiUrl.sendOtpApi);
    }
    else if(emailMobile == "Mobile"){
      Map<String, dynamic> body = {
        'telephone': mobileNumber,
      };
      sendOtpEmail(body,ApiUrl.sendOtpMobileApi);
      print("Mobile");
    }
    else{
      print("Invalid");
    }
  }

  void sendOtpEmail(Map<String, dynamic> body, String sendOtpApi) async{
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: sendOtpApi,
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
          otp = finalDecode["result"]["otp"];
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

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void verify() async{
    print("isEmail $isEmail");
    print("mobileNumber $mobileNumber");
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    String emailMobile = getEmailOrMobile(mobileNumber);

    if(isEmail == "forgot"){
      if(codeController.text == otp.toString()){
        Get.toNamed(Routes.NEWPASSWORD,arguments: {
          "emailOrMobile": mobileNumber,
        });
      }
      else{
        showSnackBar(message: "Invalid otp");
      }
    }
    else{
      if(emailMobile == "Email"){
        Map<String, dynamic> body = {
          'email': mobileNumber,
          'otp': codeController.text,
          'device_type': Platform.isAndroid ? "android" : "ios",
          'device_token': firebaseToken ?? "",
        };
        loginWithOtpApi(body,ApiUrl.loginWithOtpApi);
      }
      else if(emailMobile == "Mobile"){
        Map<String, dynamic> body = {
          'telephone': mobileNumber,
          'otp': codeController.text,
          'device_type': Platform.isAndroid ? "android" : "ios",
          'device_token': firebaseToken ?? "",
        };
        loginWithOtpApi(body,ApiUrl.loginWithMobileOtpApi);
        print("Mobile");
      }
    }
    // if(codeController.text.length == 6){
    //   if(isEmail == "email"){
    //     Get.toNamed(Routes.REGISTRATION,arguments: {
    //       "emailOrMobile": mobileNumber,
    //       "isEmail": false,
    //     });
    //   }
    //   else if(isEmail == "mobile"){
    //     Get.offAllNamed(Routes.DASHBOARD);
    //   }
    //   else if(isEmail == "password"){
    //     Get.offAllNamed(Routes.DASHBOARD);
    //   }
    //   else if(isEmail == "forgot"){
    //     Get.toNamed(Routes.NEWPASSWORD);
    //   }
    // }
  }

  void countText(String val) {
    if(val.length == 6){
      isTextChanged = true;
    }
    else{
      isTextChanged = false;
    }
    update();
  }

  Future loginWithOtpApi(Map<String, dynamic> body, String loginWithMobileOtpApi) async{
    isLoading = true;
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {'Content-Type': 'application/json'};
    print("body $body");
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
