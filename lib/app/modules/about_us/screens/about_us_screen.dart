import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/about_us_controller.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.aboutUs,
      ),
      body: GetBuilder<AboutUsController>(
        init: AboutUsController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: AppColor.darkLightColor,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          AssetsPath.circleHalf,
                          width: 124,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          AssetsPath.circleHalf1,
                          width: 124,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsPath.logo,
                              width: 90,
                              height: 47,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppText.aboutUsDecription,
                              style: AppStyle.textStyleOutfit(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.mainTextColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.aboutUsDecription1,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 72,
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.aboutUs.length,
                          itemBuilder: (context,index){

                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          controller.aboutUs[index].image,
                                          height: 48,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 7,),
                                      Center(
                                        child: Text(
                                          controller.aboutUs[index].name,
                                          style: AppStyle.textStyleOutfit(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.mainTextColor,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "Welcome to My flower tree",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        'At MyFlowerTree, we believe in the extraordinary power of flowers to convey emotions, uplift spirits, and create lasting memories. For years, we have been dedicated to transforming heartfelt sentiments into stunning floral arrangements and gifts, making us your trusted partner in expressing love, celebrating milestones, and nurturing relationships.',
                        textAlign: TextAlign.start,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Our journey began with a simple vision: to provide a seamless and delightful gifting experience that touches hearts and leaves a lasting impression. Over time, we ve grown to become a premier online destination for flowers, gifts, and heartfelt expressions.',
                        textAlign: TextAlign.start,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'With a commitment to quality, creativity, and customer satisfaction, MyFlowerTree has become synonymous with reliability and excellence in the world of gifting. Whether its a bouquet to brighten someones day, a personalized gift to make an occasion unforgettable, or a token of appreciation for a special someone, we are here to help you express your emotions with elegance and grace.',
                        textAlign: TextAlign.start,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Our story is a testament to the belief that every moment is worth celebrating, and every relationship deserves to be nurtured. Join us in the journey of creating memorable moments and spreading joy, one flower at a time. Welcome to MyFlowerTree, where emotions bloom into beautiful blossoms.',
                        textAlign: TextAlign.start,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.midTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '25+',
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              Text(
                                'Store across India',
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2M+',
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              Text(
                                'Happy customer',
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.midTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 131,
                        width: Get.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: controller.city.length,
                          itemBuilder: (context, index) {
                            final product = controller.city[index];

                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 82,
                                height: 90,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        product.image,
                                        height: 65,
                                        width: 65,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      product.name,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainTextColor,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Press coverage",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 70,
                        ),
                        shrinkWrap: true,
                        itemCount: controller.images.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 156,
                              decoration: BoxDecoration(
                                color: Colors.white, // Light white background
                                borderRadius: BorderRadius.circular(4.0), // Add rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2), // Light shadow
                                    blurRadius: 3.0, // Adjust blur radius for softness
                                    spreadRadius: 2.0, // Adjust spread for subtle effect
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    controller.images[index],
                                    height: 25,
                                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                      return const SizedBox(
                                        height: 25,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
