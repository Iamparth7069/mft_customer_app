import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {

  TextEditingController emailMobileController = TextEditingController();

  bool isLoading = false;
  bool isTextChanged = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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

  void checkIsEmail() {
    String emailMobile = getEmailOrMobile(emailMobileController.text);
    if(emailMobile == "Email"){
      Map<String, dynamic> body = {
        'email': emailMobileController.text,
      };
      sendOtpEmail(body,ApiUrl.sendOtpApi);
    }
    else if(emailMobile == "Mobile"){
      Map<String, dynamic> body = {
        'telephone': emailMobileController.text,
      };
      sendOtpEmail(body,ApiUrl.sendOtpMobileApi);
      print("Mobile");
    }
    else{
      print("Invalid");
    }
  }

  void sendOtpEmail(Map<String, dynamic> body, String loginWithMobileOtpApi) async{
    isLoading = true;
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
            "emailOrMobile": emailMobileController.text,
            "isEmail": "forgot",
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
