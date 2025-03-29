import 'package:get/get.dart';

class VerifyEmailController extends GetxController {

  String email = '';
  bool isEmail = false;

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String,dynamic> data = Get.arguments as Map<String,dynamic>;
    email = data["emailOrMobile"];
    isEmail = data["isEmail"];
    super.onInit();
  }

}
