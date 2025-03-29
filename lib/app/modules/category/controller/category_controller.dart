import 'package:customer_app/app/modules/category/model/category_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';

class CategoryController extends GetxController {

  Categories? categoryModel;
  bool isLoading = false;
  String selectedCity = "";

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  void init() async{
    getCity();
    getData();
  }

  void getCity() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String city = prefs.getString(PrefConstantsKey.selectedCity) ?? "";
    selectedCity = city;
    update();
  }

  void getData() async{
    isLoading = true;
    update();
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.category,
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
          categoryModel = Categories.fromJson(finalDecode['result']['categories']);
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

}
