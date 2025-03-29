import 'dart:async';

import 'package:customer_app/app/modules/product_detail/model/product_detail_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/common_widget.dart';
import '../../../../constants/pref_keys.dart';
import '../../../api/listing/api_listing.dart';
import '../../../api/url/api_url.dart';
import '../../home/controller/custom_carousel_controller.dart';
import '../model/option_values.dart';
import '../model/recommended_category_model.dart';
import '../model/similar_product_model.dart';

class ProductDetailController extends GetxController {

  bool isLoading = false;
  bool isSimilarLoading = false;
  ProductDetailModel? productsDetailModel;
  List<SimilarProducts> similarProducts = [];
  List<Occasion> occasionsList = [];
  List<BestProducts> bestProducts = [];

  String productSlug = "";
  final CarouselControllerTest carouselController = CarouselControllerTest();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int current = 0;
  bool active = false;
  List<OptionData> option = [];
  DateTime currentTime = DateTime.now();
  Timer? timer;
  List<OptionData> checkboxOptions = [];
  List<OptionValue> selectOptions = [];
  Duration timeLeft = const Duration(hours: 1, minutes: 25, seconds: 35);
  PlatformFile? platformFile;
  List<RecommendedCategory> categoryList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    productSlug = Get.arguments as String;
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
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

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return "$hours hrs $minutes min $seconds sec";
  }

  getData() async{
    await productDetailApi();
    getSimilarProduct();
  }

  productDetailApi() async{
    isLoading = true;
    update();
    print("productSlug $productSlug");
    try {
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: ApiUrl.productDetail + productSlug,
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
          productsDetailModel = ProductDetailModel.fromJson(finalDecode["result"]);
          timeLeft = getDurationFromNow(productsDetailModel!.timer ?? "",productsDetailModel!.timerLimit ?? "0");

          List<dynamic> parsedJson = finalDecode["result"]["options"];
          option = parsedJson.map((e) => OptionData.fromJson(e)).toList();

          List<dynamic> options = finalDecode["result"]["options"];

          List<OptionData> checkboxOptions1 = options
              .where((option) => option['type'] == 'checkbox')
              .map<OptionData>((option) => OptionData.fromJson(option))
              .toList();

          checkboxOptions.addAll(checkboxOptions1);

          List<OptionData> select = options
              .where((option) => option['type'] == 'select')
              .map<OptionData>((option) => OptionData.fromJson(option))
              .toList();
          print("select ${select.length}");
          selectOptions.addAll(select[0].optionValues);

          startTimer();
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
    finally {
      isLoading = false;
      update();
    }
  }

  getSimilarProduct() async{
    isSimilarLoading = true;
    update();

    try {
      print(productsDetailModel!.productId);

      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.similarProduct}?product_id=${productsDetailModel!.productId}&category_id=${productsDetailModel!.catId}",
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
          List<Occasion> occasionModel = (finalDecode['result']['upcomming_occasion'] as List)
              .map((occasionData) => Occasion.fromMapMap(occasionData))
              .toList();
          occasionsList.addAll(occasionModel);
          List<SimilarProducts> productsModel = (finalDecode['result']['similar_products'] as List)
              .map((productJson) => SimilarProducts.fromJson(productJson))
              .toList();
          similarProducts.addAll(productsModel);
          List<RecommendedCategory> recommendedCategory = (finalDecode['result']['recommended_category'] as List)
              .map((productJson) => RecommendedCategory.fromJson(productJson))
              .toList();
          categoryList.addAll(recommendedCategory);
          print("categoryList ${categoryList.length}");
          // List<BestProducts> bestProductsModel = (finalDecode['result']['products'] as List)
          //     .map((productJson) => BestProducts.fromJson(productJson))
          //     .toList();
          // bestProducts.addAll(bestProductsModel);


        }
        else{
          showSnackBar(message: finalDecode["message"].toString());
        }
        isSimilarLoading = false;
        update();
      }
      else {
        showSnackBar(message: getResponse.body);
        isSimilarLoading = false;
        update();
      }
      // ignore: non_constant_identifier_names
    } catch (e) {
      isSimilarLoading = false;
      update();
    }
    finally {
      isSimilarLoading = false;
      update();
    }
  }

  Duration getDurationFromNow(String dateTimeString, String timerLimit) {
    DateTime now = DateTime.now();
    DateTime todayMidnight = DateTime(now.year, now.month, now.day, int.parse(timerLimit), 0, 0);
    Duration difference = todayMidnight.difference(now);
    return difference;
  }

  void changeImage(int index) {
    current = index;
    update();
  }

  void isActive(bool isExpanded, int index) {
    active = isExpanded;
    update();
  }

  void checkAvailability() {
    if(pinCodeController.text.isEmpty){
      showSnackBar(message: "Please Enter Pin Code");
    }
    else{
      checkAvailabilityApi();
    }
  }

  checkAvailabilityApi() async{
    isLoading = true;
    update();
    try {
      print("${ApiUrl.checkAvailability}${pinCodeController.text}&product_id=${productsDetailModel!.productId}&product_type=${productsDetailModel!.type}");
      Map<String, dynamic> response = await NetworkService.makeGetRequest(
        url: "${ApiUrl.checkAvailability}${pinCodeController.text}&product_id=${productsDetailModel!.productId}&product_type=${productsDetailModel!.type}",
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
          showSnackBar(message: finalDecode["message"].toString());
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
    finally {
      isLoading = false;
      update();
    }
  }

  void selectVegNonVeg(OptionData checkboxOption) async{
    for (var option in checkboxOptions) {
      if (option != checkboxOption) {
        option.isSelected = false;
      }
    }
    checkboxOption.isSelected = !checkboxOption.isSelected;
    update();
    final selectedOption = checkboxOptions.firstWhereOrNull((option) => option.isSelected);
    print("selectedOption?.optionValues[0].id ${selectedOption?.optionValues[0].id}");
    if(selectedOption?.optionValues[0].id == null){
      await updatePrice([],productsDetailModel?.productId);
    }
    else{
      String id = selectedOption?.optionValues[0].id ?? "";
      await updatePrice([id],productsDetailModel?.productId);
    }
    print(checkboxOption.optionValues[0].id);
  }

  void toggleServiceSelection(int index) {
    print("checkboxOptions[index] ${checkboxOptions[index]}");
    checkboxOptions[index].isSelected = !checkboxOptions[index].isSelected;
    update();
  }

  void selectWeight(OptionValue optionValues) async{
    for (var option in selectOptions) {
      if (option != optionValues) {
        option.isSelected = false;
      }
    }
    optionValues.isSelected = !optionValues.isSelected;
    update();
    final selectedOption = selectOptions.firstWhereOrNull((option) => option.isSelected);
    print("selectedOption?.optionValues[0].id ${selectedOption?.id}");
    if(selectedOption?.id == null){
      await updatePrice([],productsDetailModel?.productId);
    }
    else{
      String id = selectedOption?.id ?? "";
      await updatePrice([id],productsDetailModel?.productId);
    }
    update();
  }

  void selectFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.size);
      if ((file.extension == 'jpg' || file.extension == 'png') &&
          file.size <= 8 * 1024 * 1024) {
        platformFile = result.files.first;
        update();
      } else {
        showSnackBar(message: "File size exceeds 8 MB limit");
      }
    } else {
      return;
    }
    update();
  }

  Future<void> uploadImage() async {
    if(platformFile != null){
      try{
        String image = platformFile!.name;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString(PrefConstantsKey.token);
        Map<String, dynamic> body = {
          'image': image,
        };
        Map<String, String> headers = {
          'Authorization': 'Bearer ${token ?? ""}',
          'Content-Type': 'application/json',
        };
        Map<String, dynamic> response = await NetworkService.makePostRequest(
          url: ApiUrl.uploadProductImage,
          body: body,
          headers: headers,
        );
        int statusCode = response['statusCode'];
        if(statusCode == 200){
          showSnackBar(message: "ImageUploaded");
        }else{
          showSnackBar(message: "Fail");
        }
      }catch(e){
        print("Exception ${e.toString()}");
      }
    }else{
      print("Nothing ");
    }
  }

  Future<void> updatePrice(List<String> id, int? productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(PrefConstantsKey.token);
    print(id);
    Map<String, dynamic> body = {
      'product_id': productId,
      'options' : id.toString(),
    };
    Map<String, String> headers = {
      'authorization': 'bearer ${token ?? ""}',
      'Content-Type': 'application/json',
    };
    print(body);
    Map<String, dynamic> response = await NetworkService.makePostRequest(
      url: ApiUrl.productOptionUpgrade,
      body: body,
      headers: headers,
    );
    try{
      dynamic responseBody = response['response'];
      int statusCode = response['statusCode'];
      Response getResponse = Response(
        body: responseBody,
        statusCode: statusCode,
      );
      if (getResponse.statusCode == 200) {

        var finalDecode = getResponse.body;
        print("Status $finalDecode");
        if (finalDecode["status"] == true) {
          productsDetailModel?.price = finalDecode["result"]["price"];
          productsDetailModel?.special = finalDecode["result"]["special"];
          update();
        } else {
          showSnackBar(message: finalDecode["message"].toString());
        }
        update();
      } else {
        showSnackBar(message: getResponse.body);
        update();
      }
    }catch(e){
      showSnackBar(message: e.toString());
      update();
    }
  }

}