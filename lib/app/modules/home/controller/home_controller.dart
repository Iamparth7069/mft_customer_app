import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../../routes/app_pages.dart';
import '../model/recent_data.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {

  HomeModel? homeModelData;
  final ScrollController scrollController = ScrollController();
  final double expandedHeight = 400.0;
  bool isTitleSticky = false;
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool showBtn = false;
  bool isLastPage = false;
  String selectedCity = "";
  Duration timeLeft = const Duration(hours: 1, minutes: 25, seconds: 35);
  Timer? timer;
  List<RecentData> recentView = [];

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController.addListener(_scrollListener);
    getCity();
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double threshold = expandedHeight * 0.6; // 30% of the expanded height
    if (scrollController.position.pixels >= threshold) {
      if (!isTitleSticky) {
        showBtn = true;
        isTitleSticky = true;
        update();
      }
    } else {
      if (isTitleSticky) {
        showBtn = true;
        isTitleSticky = false;
        update();
      }
    }
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
        url: ApiUrl.homeApi,
      );

      dynamic responseBody = response['response'];
      print(responseBody);
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        if(finalDecode["status"] == true){
          homeModelData = HomeModel.fromJson(finalDecode["result"]);
          timeLeft = getDurationFromNow(homeModelData!.exploreNowTimer ?? "");
          startTimer();
          recentViewDataGet();
          isLoading = false;
          update();
        }
        else {
          showSnackBar(message: getResponse.body["result"]["error"].toString());
          Get.offAllNamed(Routes.LOGIN);
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

  void scrollTop() {
    scrollController.animateTo( //go to top of scroll
      0,  //scroll offset to go
      duration: const Duration(milliseconds: 500), //duration of scroll
      curve:Curves.fastOutSlowIn, //scroll type
    );
  }

  changePage(bool page) {
    isLastPage = page;
    update();
  }

  Duration getDurationFromNow(String dateTimeString) {
    DateTime now = DateTime.now();
    DateTime targetDateTime = DateFormat("yyyy/MM/dd HH:mm:ss").parse(dateTimeString);
    DateTime endOfDay = DateTime(targetDateTime.year, targetDateTime.month, targetDateTime.day, 23, 59, 59);
    Duration difference = endOfDay.difference(now);
    return difference;
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return "$hours hrs $minutes min $seconds sec left";
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      reduceTime();
    });
  }

  void reduceTime() {
    if (timeLeft.inSeconds > 0) {
      timeLeft = timeLeft - const Duration(seconds: 1);
      update();  // Notify GetBuilder to rebuild
    } else {
      timer?.cancel();
    }
  }

  void addOrRemoveWishList(String productId, String wishListProduct) async{
    try {
      print(productId);
      Map<String, dynamic> response = await NetworkService.makePostRequest(
        url: wishListProduct.isEmpty ? ApiUrl.addWishList : ApiUrl.removeWishList,
        body: {
          "product_id": productId,
        },
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
          getData();
          recentViewDataGet();
          showSnackBar(message: finalDecode["message"].toString());
        }
        else{
          showSnackBar(message: finalDecode["result"]["error"]["category"].toString());
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

  Future<void> recentViewDataGet() async {
    Map<String, dynamic> response = await NetworkService.makeGetRequest(
      url: ApiUrl.recentlyViewed,
    );
    dynamic responseBody = response['response'];
    print(responseBody);
    int statusCode = response['statusCode'];
    Response getResponse = Response(
      body: responseBody,
      statusCode: statusCode,
    );
    if (getResponse.statusCode == 200) {
      var finalDecode = getResponse.body;
      if (finalDecode["status"] == true) {
        List<dynamic> productsJson = finalDecode['result']['products'];
        recentView = productsJson.map((json) => RecentData.fromJson(json)).toList();
      } else {
        showSnackBar(message: getResponse.body["result"]["error"].toString());

        update();
      }
      update();
    } else {
      showSnackBar(message: getResponse.body);
      update();
    }
  }


}
