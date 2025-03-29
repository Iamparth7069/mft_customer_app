import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/custom_carousel_controller.dart';

class Carousel extends StatelessWidget {
  final List<Widget> pages;
  final Duration nextPageDuration = const Duration(milliseconds: 10000);
  final void Function({required bool isLastPage})? onPageChanged;
  const Carousel({super.key,required this.pages,this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<CarouselControllerTest>(
      init: CarouselControllerTest(),
      builder: (controller) {
        return Stack(
          children: [
            SizedBox(
              width: width,
              child: PageView(
                controller: controller.pageController,
                children: pages,
              ),
            ),
            const SizedBox(height: 30,),
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              child: _CarouselRectangle(
                rectangleNumber: pages.length,
                currentRectangle: controller.pageController.positions.isEmpty ? 0 : controller.pageController.page!.round(),
                onRectangleTapped: controller.animateToPage,
              ),
            )
          ],
        );
      },
    );
  }

}

class _CarouselRectangle extends StatelessWidget {
  final int rectangleNumber;
  final int currentRectangle;
  final double rectangleSize = 20;
  final Function(int) onRectangleTapped;
  const _CarouselRectangle({required this.rectangleNumber, required this.currentRectangle, required this.onRectangleTapped});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Iterable.generate(rectangleNumber).map((i) {
        return Container(
          padding: const EdgeInsets.all(3),
          child: Image.asset(
            (i == currentRectangle) ? AssetsPath.halfCircle : AssetsPath.fillCircle,
            height: 12,
            width: 12,
          ),
        );
      }).toList(),
    );
  }
}