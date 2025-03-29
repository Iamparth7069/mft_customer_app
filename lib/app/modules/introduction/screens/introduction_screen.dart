import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/introduction_controller.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder<IntroductionController>(
        init: IntroductionController(),
        builder: (controller) {
          return Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller.pageController,
                onPageChanged: (value){
                  controller.onChange(value);
                },
                itemCount: controller.slides.length,
                itemBuilder: (context, index){
                  return Slider(
                    index: index,
                    image: controller.slides[index].image,
                    title: controller.slides[index].title,
                    description: controller.slides[index].description,
                  );
                },
              ),
              Positioned(
                top: 0,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsPath.mftLogo,
                            height: 20,
                          ),
                          const SizedBox(width: 15,),
                          Text(
                            AppText.welcomeMyFlowerTree,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.slides.length, (index) => Container(
                        height: 6,
                        width: controller.currentIndex == index ? 25 : 6,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: controller.currentIndex == index ? AppColor.illusionTextColor : AppColor.dividerColor,
                        ),
                      ),
                      ),
                    ),
                    /// button
                    GestureDetector(
                      onTap: (){
                        controller.changePage();
                      },
                      child: SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                          child: commonButton(title: AppText.letsGetStarted),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

// ignore: must_be_immutable
class Slider extends StatelessWidget {
  String image,title,description;
  int index;

  Slider({super.key, required this.image, required this.title, required this.description,required this.index});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<IntroductionController>(
      builder: (controller) {
        return index == 0 ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainTextColor,
                    ),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    description,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 30,),
                Expanded(
                  child: Image.asset(
                    image,
                  ),
                ),
              ],
            ) :
        index == 1 ? Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Image.asset(
              image,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 130),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.mainTextColor,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ],
      ) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 130,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: AppStyle.textStyleOutfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColor.mainTextColor,
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
                maxLines: 3,
              ),
            ),
            Expanded(
              child: Image.asset(
                image,
              ),
            ),
          ],
        );
      }
    );
  }
}