import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/pref_keys.dart';

class ProfileController extends GetxController {

  String userId = "";

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString(PrefConstantsKey.userId) ?? "";
    update();
  }

}