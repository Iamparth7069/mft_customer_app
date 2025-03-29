import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/delivery_cities_model.dart';

class DeliveryCitiesController extends GetxController {

  bool isLoading = false;
  List<TopCity> topCityList = [];
  List<DeliveryCity> deliveryCityList = [];
  List<DeliveryCity> cityList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
  getData(){
    topCityListApi();
    allCityListApi();
  }

  topCityListApi() async{
    isLoading = true;
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.topCitiesApi,
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
          List<TopCity> cities = (finalDecode['result']['city'] as List)
              .map((cityJson) => TopCity.fromJson(cityJson))
              .toList();
          topCityList = cities;
          print(topCityList.length);
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

  allCityListApi() async{
    isLoading = true;
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.deliveryLocationsApi,
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
          List<DeliveryCity> cities = (finalDecode['result']['city'] as List)
              .map((cityJson) => DeliveryCity.fromJson(cityJson))
              .toList();
          deliveryCityList = cities;
          print(deliveryCityList.length);
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

  void searchCity(String val) {
    if(val.isNotEmpty){
      getCityName(searchController.text.trim());
    }
    else{
      print("Else======>");
      cityList.clear();
      update();
    }
  }

  Future<void> getCityName(String name) async {
    if (name.isEmpty) {
    } else {
      cityList = deliveryCityList
          .where((city) => city.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      update();
    }
    update();
  }

}