import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselControllerTest extends GetxController {

  final PageController pageController = PageController(initialPage: 0);

  void toNextPage() {
    pageController.nextPage(duration: const Duration(milliseconds: 10000), curve: Curves.easeIn);
  }
  int currentPage = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      update(); // Notify listeners about the change in page
    });

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(page, duration: const Duration(milliseconds: 10000), curve: Curves.easeIn);
  }

}