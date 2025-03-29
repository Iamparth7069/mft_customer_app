import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../product/model/category_model.dart';
import '../model/suggestion_product_model.dart';
import '../model/trending_search_model.dart';

class SearchProductController extends GetxController {

  SuggestionModel? suggestionModel;
  List<String> nameList = [];
  TextEditingController searchController = TextEditingController();
  bool isTrendingSearch = false;
  List<TrendingSearchModel> trendingSearchList = [
    TrendingSearchModel(categoryName: "Flowers"),
    TrendingSearchModel(categoryName: "Cakes"),
    TrendingSearchModel(categoryName: "Mini cakes"),
    TrendingSearchModel(categoryName: "30 min delivery"),
    TrendingSearchModel(categoryName: "Birthday gifts"),
    TrendingSearchModel(categoryName: "Plants"),
    TrendingSearchModel(categoryName: "Anniversary gifts"),
    TrendingSearchModel(categoryName: "Personalised gifts"),
  ];
  List<Category> categoryList = [
    Category(categoryName: "Birthday", typeId: "", type: "", image: "https://s3-alpha-sig.figma.com/img/c357/a712/cfe0e4f6e08003b751286d0e8115ab9b?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z6OErePiLKEAVYftSzoFBlHizvALvvML1jEF6FoMhvRYsX1gwUS4JfA4ZtTzLImJmwNtjVvSe2PUpYD~qZ1IJZYTLo~kPunZ3Y3inWslTwo6CcMGzQWKOg49ac7pMwzGH~CY6L8j24J4WO8elSLB5XgCLXSFvSuTmkXr7L3CCjxDe-2MrHWtOsngmYEZI74Og1x8e0bUhTFT9Tac-c1ap8-lAsocAyG~tFHcWGrxf7UdPspNTCc~8tuEkUG~6ed0PdL8PFp3qUQjrSTuK9DPrE1rdJCdI-Ev1FnFSx0eNSO62AWhigHSw8-7Yi3vIqUp-ZUfNtkcoCfTOhB~QibBPA__"),
    Category(categoryName: "Flower", typeId: "", type: "", image: "https://s3-alpha-sig.figma.com/img/8d46/3d2a/eb9bc84dc1d8f6ed9cf609e7c4a4aab5?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UYqUDKDbhrsSgODQrrUIoybmkRM9~AZORnbzg0fuxI1WFOcHPhG4bTvHUEyn8FWLIHmMb5FRbCQTsKTSdLAB8RSlKBv-jkJF57sPrcKTJ5Z41InhHf04m7YdkpTJOUElEW2qxUUghe6NMW82r~SzK8oQKAiHkDyZLJ7sM8J7a4Z25eOLKh1nhnxYy8G7JFI~Qnf4PfDKwlukR14giRTv-i6j2nwC2WTDjYD90lSQ08j5aF2cbK5dQiN68zWEX0U2~SXXm-2X6xTZ6fjh0W2RZ96OPkV0vIQmK37-iYxZrfM32yi0YEGrOZy1M6U2af7UWCI7wJ-orYfWRV4xglXbVg__"),
    Category(categoryName: "Cake", typeId: "", type: "", image: "https://s3-alpha-sig.figma.com/img/f253/9c29/c2930098df2feb0f1fec5818c579b8a3?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mCpxYRiE1-uo~KmYIi53P2wemfNGlHnpxF6OFBOtalM5LT5rzSC72bydg7GdxwKyuIeGW0ItIZEB0leei~zkG-8FHteH-S1wfQiCDkWd1PNdEnPfRMxBfEv1SNV6jjQUs~sjPFHWqEUoxUyMg62UYaa-ti2fRq23ONS4vQscHvZHUyGOrTgLNw1PW7xcK4o3uYOBlWaM6x67jYiSNJJGi8KlpyfKT1TLTte3GEWyKdy4u3IZe~p7hXLFaF7Q2iIBlalIWJI5cqFwtgcvwJesGTmEoPWjyFiMjBwkD0hpRgBEW0RYa~odlhlHsZRvFwbrQDjmnqgSO0aeL~OiRcWM7w__"),
    Category(categoryName: "Plant", typeId: "", type: "", image: "https://s3-alpha-sig.figma.com/img/7848/bc52/e90467458b1bde66cc03b5fff5332b4c?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BtW5F2yIA4B-oFhfru38mMCJaGf-0LPbzXh10dftcFf6VHtaDnd2uDM08T-D2g4xPbJuokCIT6bv7CuNKA2-NI8HC~JVmMyWYJX4nOhBP0H5VW8F0bd4J-xc8-hvhwFgmGX8OKXPxtBo6cdAV183HiyOYqXEWsA4L92ZfF4hfntIfgSnRfmZQSphEfZCqDd0oTQuSmo0DGw43bU3HtR9-6OwPkxZqf-EUdw~ij8ezQ9NSrwVs2SaH6~9OmKWAlJBJhDuzTdRdP1fYp5LAZXjtPnn2Ea4Hk~Exvjvtt-zl2BwK315wHPc61B~WRUuHxobjeJQbCjarbs7yu3YwamiqQ__"),
    Category(categoryName: "Combo", typeId: "", type: "", image: "https://s3-alpha-sig.figma.com/img/031d/ef90/5c46fd3205fb10ac1a1f3def08251f17?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nGO6zi~96VQFgX9cXZ3cxP2ikNLKbFZKs52I70HIml2Rw2alPHhfMspN17RzkttNg2HvOItVhIlFbZTUILC84SBnpP02wQWw6giWQNUUjSz~zhSlM87xX9Pg152YLwv-e8JXfgbaWauMcSHIf~qGYbC9b9wFtIIlTEObDwTI-6H25xBtN47ElJfJIJzs8ehKzK5uR-JGwulvV7f2YILyefUbwAQT5N4u6SRYHiXaGVhdw-J~YwIu0~ADOUEP~JZECT61n4dMTQ8aP9h91kpqGBUnoBNc257bIOR0oCu8WxORS5nt29nGZF~fuBoHGO-HOlbFrXm0WCp4xXJUAFQ6gA__"),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    // getData();
    super.onInit();
  }

  void getData() {
    getTrendingSearch();
  }

  getTrendingSearch() async{
    isTrendingSearch = true;
    update();

    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.popularSearchApi,
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
          List<TrendingSearchModel> productsModel = (finalDecode['result']['lists'] as List)
              .map((productJson) => TrendingSearchModel.fromJson(productJson))
              .toList();

          trendingSearchList.addAll(productsModel); // Append new products
          print(trendingSearchList.length);
        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isTrendingSearch = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isTrendingSearch = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isTrendingSearch = false;
      update();
      print("Error: $e");
    }
    finally {
      isTrendingSearch = false;
      update(); // Trigger UI update
    }
  }

  Future<void> getSuggestionProductName(String name) async {
    nameList = [
      "Flowers",
      "Cakes",
      "Mini cakes",
      "Birthday gifts",
      "Plants",
      "Anniversary gifts",
      "Personalised gifts",
    ];
    update();
    // try {
    //   Map<String, dynamic> response = await NetworkService.makeGetRequest(
    //     url: "https://neobooz.com/api/v1/products/suggestion-product?guest_id=1&name=$name",
    //   );
    //
    //   dynamic responseBody = response['response'];
    //   int statusCode = response['statusCode'];
    //   Response getResponse = Response(
    //     body: responseBody,
    //     statusCode: statusCode,
    //   );
    //   if (getResponse.statusCode == 200) {
    //     nameList = [];
    //     var finalDecode = getResponse.body;
    //     suggestionModel = SuggestionModel.fromJson(finalDecode);
    //     for(int i=0; i< suggestionModel!.products!.length; i++){
    //       nameList.add(suggestionModel!.products![i].name!);
    //     }
    //     print("nameList $nameList");
    //   }
    //   else {
    //     showSnackBar(message: getResponse.body);
    //   }
    //   update();
    //   // ignore: non_constant_identifier_names
    // } catch (e) {
    //   print("Error: $e");
    // }
  }

}