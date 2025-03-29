import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';

class NewPasswordController extends GetxController {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
  bool isTextConfirmObscure = true;
  int strength = 0;
  bool eightCharacters = false;
  bool smallCase = false;
  bool uppercase = false;
  bool specialCharacter = false;
  bool numeric = false;
  Color indicatorColor = AppColor.greyMidBgColor;
  String strengthText = "";
  String emailOrMobile = "";

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String,dynamic> data = Get.arguments as Map<String,dynamic>;
    emailOrMobile = data["emailOrMobile"];
    super.onInit();
  }

  void changeText(String text) {
    if(passwordController.text.isEmpty){
      isTextChanged = false;
    }
    else{
      isTextChanged = true;
    }
    strength = calculatePasswordStrength(passwordController.text);
    indicatorColor = getColorForStrength(strength);
    strengthText = getTextForStrength(strength);
    update();
  }

  void showPassword() {
    isTextObscure = !isTextObscure;
    update();
  }

  void showConfirmPassword() {
    isTextConfirmObscure = !isTextConfirmObscure;
    update();
  }

  int calculatePasswordStrength(String password) {
    int strength = 0;

    if (password.length >= 8) {
      strength += 1;
    }
    if (password.contains(RegExp(r'[A-Z]'))) {
      strength += 1;
    }
    if (password.contains(RegExp(r'[a-z]'))) {
      strength += 1;
    }
    if (password.contains(RegExp(r'[0-9]'))) {
      strength += 1;
    }
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      strength += 1;
    }

    return strength;
  }

  Color getColorForStrength(int strength) {
    switch (strength) {
      case 5:
        return AppColor.successColor;
      case 4:
        return Colors.lightGreen;
      case 3:
        return Colors.yellow;
      case 2:
        return AppColor.warningColor;
      case 1:
      case 0:
      default:
        return AppColor.errorColor;
    }
  }

  String getTextForStrength(int strength) {
    switch (strength) {
      case 5:
        return 'Very Strong';
      case 4:
        return 'Strong';
      case 3:
        return 'Medium';
      case 2:
        return 'Weak';
      case 1:
        return 'Very Weak';
      case 0:
        return '';
      default:
        return '';
    }
  }

  void resetPassword() async{
    isLoading = true;
    update();

    var body = {
      'email': emailOrMobile,
      'password': passwordController.text,
      'confirm_password': confirmPasswordController.text,
    };
    print(body);
    print(ApiUrl.forgotPasswordApi);
    try {
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: ApiUrl.forgotPasswordApi,
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
          Get.toNamed(Routes.SUCCESS);
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
