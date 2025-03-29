import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../product/model/filter_model.dart';
import '../model/result_model.dart';
import '../model/order_model.dart';
import '../screen/widget/bottom_sheet_add_review.dart';

class OrderController extends GetxController {

  TextEditingController writeReviewController = TextEditingController();
  final double userRating = 3.0;
  final bool isVertical = false;
  List<Order> orderData = [];
  OrderResult? orderResult;
  // OrderModel(
  //   orderType: "Expected delivery on 10 May 2024",
  //   color: 0xff00B57F,
  //   deliveryType: "Order received",
  //   id: "#9866776",
  //   name: 'Bouquet of emotion Cake',
  //   discountPrice: "₹510",
  //   price: "₹600",
  //   image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
  // ),
  // OrderModel(
  //   color: 0xff00B57F,
  //   orderType: "On 05 May 2024",
  //   discountPrice: "₹510",
  //   price: "₹600",
  //   deliveryType: "Delivered",
  //   id: "#9866776",
  //   name: 'Coffee chocochip cake',
  //   image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
  // ),
  // OrderModel(
  //   color: 0xffF61800,
  //   orderType: "On 03 May 2024 as per your request",
  //   discountPrice: "₹510",
  //   price: "₹600",
  //   deliveryType: "Cancellled",
  //   id: "#9866776",
  //   name: 'Pink roses photo bouque',
  //   image: "https://s3-alpha-sig.figma.com/img/0033/7182/de549845e9aa42a2179be65bdcea8166?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=caRf8V8gVte7k2SaasJaLf4-WlNW1b5eQx~j17gn2Y42x0tnNXuh6feI8zHvpWnN~IJXkKoEhlTvFKei4MO23vM0GbpD6WeZqILg7vYhWJzjrFF5I74ODrdg5uagqV-VyVZBxptKpTZjWb3jn1kSdGg-1JpyLjQuAyruwb3Z6KbyoDIWCXoeyMD23rjELRhmdctemfSQr3Cmy4q1erDosEXGVbGdnVI04hw3m2LNAHjBjF8d2LndwbruGrVp5~317gbLyr4kdpksdeZ2~cJU1wKpvZWmaACJmX7sxZYL0YUQWAV9tyVXug~eG49Nrl7vyDKb4HQo62yH~1bTJQdOyg__",
  // ),
  // OrderModel(
  //   color: 0xff747B85,
  //   orderType: "On 05 May 2024",
  //   discountPrice: "₹510",
  //   price: "₹600",
  //   deliveryType: "Refund credited",
  //   id: "#5436776",
  //   name: 'Coffee chocochip cake',
  //   image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
  // ),
  // OrderModel(
  //   color: 0xff747B85,
  //   orderType: "On 05 May 2024",
  //   discountPrice: "₹510",
  //   price: "₹600",
  //   deliveryType: "Refund credited",
  //   id: "#5436776",
  //   name: 'Coffee chocochip cake',
  //   image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
  // ),

  int categorySelectedIndex = 0;
  List<FilterModel> filterModelList = [
    // FilterModel(name: "Order status",isSelected: true,subFilter: [
    //   SubFilter(name: "On the way",isSelected: false),
    //   SubFilter(name: "Delivered",isSelected: false),
    //   SubFilter(name: "Cancelled",isSelected: false),
    //   SubFilter(name: "Refunded",isSelected: false),
    // ],),
    // FilterModel(name: "Order time",isSelected: false,subFilter: [
    //   SubFilter(name: "Last 30 days",isSelected: false),
    //   SubFilter(name: "2023",isSelected: false),
    //   SubFilter(name: "2022",isSelected: false),
    //   SubFilter(name: "2021",isSelected: false),
    //   SubFilter(name: "Older",isSelected: false),
    // ]),
  ];

  void addReview() {
    Get.bottomSheet(
      BottomSheetAddReview(ratting: 0,title: AppText.feedbackAndReview,),
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  String getTextRatting(double ratting) {
    switch (ratting.toInt()) {
      case 1:
        return "Hated it";
      case 2:
        return "Didn’t like it";
      case 3:
        return "Was good";
      case 4:
        return "Liked it";
      case 5:
        return "Loved it";
      default:
        return "";
    }
  }
  bool isLoading = false;


  @override
  void onInit() {
    // TODO: implement onInit
    getDataForOrder();
    super.onInit();
  }
  void selectFilter(int index) {
    for(int i = 0; i < filterModelList.length; i++){
      if(filterModelList[i].name == filterModelList[index].name){
        filterModelList[i].isSelected = true;
      }
      else{
        filterModelList[i].isSelected = false;
      }
    }
    categorySelectedIndex = index;
    update();
  }

  void isChecked(SubFilter selectedSubFilter) {
    selectedSubFilter.isSelected = !selectedSubFilter.isSelected;
    // List<SubFilter> subFilters = filterModelList[categorySelectedIndex].subFilter;
    // for (var subFilter in subFilters) {
    //   subFilter.isSelected = subFilter == selectedSubFilter;
    // }
    update();
  }

  Future<void> getDataForOrder() async {
    isLoading = true;
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.orders,
      );

      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      log("Response Body: ${responseBody.toString()}");
      if (statusCode == 200) {
        if (responseBody is Map<String, dynamic>) {
          print("responseBody ${responseBody.runtimeType}");
          if (responseBody["status"] == true) {
            print(responseBody['result'].runtimeType);
            var result = responseBody['result'] as Map<String, dynamic>;
            var orderStatusList = result['order_status'] as List<dynamic>;
            List<Map<String, String>> orderStatus = orderStatusList.map((item) {
              var key = item.keys.first as String;
              var value = item[key].toString();
              return {key: value};
            }).toList();
            var yearsList = result['years'] as List<dynamic>;
            List<Map<String, int>> years = yearsList.map((item) {
              var key = item.keys.first as String;
              var value = int.parse(key); // Convert string key to int
              return {key: value};
            }).toList();
            filterModelList = [
              // FilterModel(
              //   name: "Order status",
              //   isSelected: true,
              //   subFilter: orderStatus.map((status) {
              //     String name = status.keys.first;
              //     return SubFilter(name: name, isSelected: false);
              //   }).toList(),
              // ),
              // FilterModel(
              //   name: "Order time",
              //   isSelected: false,
              //   subFilter: years.map((year) {
              //     String name = year.keys.first;
              //     return SubFilter(name: name, isSelected: false);
              //   }).toList(),
              // ),
            ];
            // List<Order> orderDatas = (finalDecode['result']['orders'] as List)
            //     .map((orderDatas) => Order.fromJson(orderDatas))
            //     .toList();
            // orderData.addAll(orderDatas);
            // orderResult = OrderResult.fromJson(finalDecode['result']);

          } else {
            showSnackBar(message: responseBody["message"].toString());
          }
        }
      }

    } catch (e) {
      print("Error: $e");
      showSnackBar(message: "An error occurred: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

}