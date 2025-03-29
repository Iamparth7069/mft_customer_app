import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../model/wallet_model.dart';

class MftWalletController extends GetxController{

  TextEditingController amountController = TextEditingController();
  String? selectedValue = "May 2024"; // This holds the currently selected value
  List<Wallet> data = [];
  bool isLoading = false;
  bool isWalletLoading = false;
  String totalBalance = "0.0";
  int currentPage = 1;
  bool hasMorePages = true;
  bool isFetchingNewPage = false;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    amountController.text = "0.00";
    getWalletData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getWalletData(isNextPage: true);
      }
    });
    super.onInit();
  }

  getWalletData({bool isNextPage = false}) async{
    isLoading = true;
    if (isNextPage && !hasMorePages) return; // Stop if no more pages

    isFetchingNewPage = true;
    if (!isNextPage) {
      isWalletLoading = true;
      currentPage = 1; // Reset to first page
      data.clear(); // Clear the existing list
    }
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.walletHistory}&page=$currentPage",
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {
        var finalDecode = getResponse.body;
        print("finalDecode $finalDecode");
        if(finalDecode["status"] == true){
          List<Wallet> walletModel = (finalDecode['result']['wallets'] as List)
              .map((walletJson) => Wallet.fromJson(walletJson))
              .toList();
          totalBalance = finalDecode['result']['total_balance'] ?? "0.00";

          if (walletModel.isEmpty) {
            hasMorePages = false; // No more pages if new list is empty
          } else {
            currentPage++; // Increment the page for the next fetch
            data.addAll(walletModel);
          }
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isLoading = false;
        isFetchingNewPage = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isLoading = false;
        isFetchingNewPage = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isLoading = false;
      isFetchingNewPage = false;
      update();
    }
    finally {
      isFetchingNewPage = false;
      isLoading = false;
      update();
    }
  }

}