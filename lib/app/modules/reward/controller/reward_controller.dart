import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/reward_model.dart';

class RewardController extends GetxController{

  String? selectedValue = "May 2024"; // This holds the currently selected value
  List<RewardModel> data = [];
  bool isLoading = false;
  bool isRewardLoading = false;
  String totalBalance = "0.0";
  int currentPage = 1;
  bool hasMorePages = true;
  bool isFetchingNewPage = false;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    getRewardData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getRewardData(isNextPage: true);
      }
    });
    super.onInit();
  }

  getRewardData({bool isNextPage = false}) async{
    isLoading = true;
    if (isNextPage && !hasMorePages) return; // Stop if no more pages

    isFetchingNewPage = true;
    if (!isNextPage) {
      isRewardLoading = true;
      currentPage = 1; // Reset to first page
      data.clear(); // Clear the existing list
    }
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.rewardHistory}&page=$currentPage",
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
          List<RewardModel> rewardModel = (finalDecode['result']['rewards'] as List)
              .map((rewardJson) => RewardModel.fromJson(rewardJson))
              .toList();
          totalBalance = finalDecode['result']['total_balance'] ?? "0.00";
          if (rewardModel.isEmpty) {
            hasMorePages = false; // No more pages if new list is empty
          } else {
            currentPage++; // Increment the page for the next fetch
            data.addAll(rewardModel);
          }
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
    }
    finally {
      isLoading = false;
      isFetchingNewPage = false;
      update();
    }
  }

}