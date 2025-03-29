import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/app_color.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:customer_app/constants/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_style.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkLightColor,
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.profile,
                            style: AppStyle.textStyleOutfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          controller.userId.isEmpty ? Container() : GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.EDITPROFILE);
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  AssetsPath.icEdit,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 8,),
                                Text(
                                  AppText.editProfile,
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.easternBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Center(
                        child: Image.asset(
                          AssetsPath.profileImage,
                          height: 86,
                          width: 86,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      controller.userId.isNotEmpty ? Column(
                        children: [
                          Text(
                            "John Doe",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "johndoe@gmail.com",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.midTextColor,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Container(
                                width: 1,
                                height: 15,
                                color: AppColor.dividerColor,
                              ),
                              const SizedBox(width: 8,),
                              Flexible(
                                child: Text(
                                  "+91 88888 774474",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.midTextColor,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ) : commonButton(title: AppText.loginRegister),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 330),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              customTopView(
                                AssetsPath.icStander,
                                AppText.myOrders,
                                () {
                                  Get.toNamed(Routes.ORDER);
                                },
                              ),
                              const SizedBox(width: 16,),
                              customTopView(
                                AssetsPath.icWishlist,
                                AppText.wishlist,
                                () {
                                  Get.toNamed(Routes.WISHLIST);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              customTopView(
                                AssetsPath.icChatWithUs,
                                AppText.chatWithUs,
                                () {
                                  Get.toNamed(Routes.CHATWITHUS);
                                },
                              ),
                              const SizedBox(width: 16,),
                              customTopView(
                                AssetsPath.icTrackOrder,
                                AppText.trackMyOrder,
                                () {
                                  Get.toNamed(Routes.ORDERTRACK1);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          const Divider(
                            color: AppColor.dividerColor,
                          ),
                          const SizedBox(height: 16,),
                          controller.userId.isEmpty ? Container() : Column(
                            children: [
                              customBottomView(AssetsPath.location, AppText.manageAddress,() {
                                Get.toNamed(Routes.DELIVERYADDRESS);
                              }),
                              customBottomView(AssetsPath.icStar, AppText.myReview,() {
                                Get.toNamed(Routes.MYREVIEW);
                              }),
                              customBottomView(AssetsPath.icWallet, AppText.mftWallet,() {
                                Get.toNamed(Routes.MFTWALLET);
                              }),
                              customBottomView(AssetsPath.icReward, AppText.rewards,() {
                                Get.toNamed(Routes.REWARD);
                              }),
                            ],
                          ),
                          customBottomView(AssetsPath.icHelpCenter, AppText.helpCenter,() {
                            Get.toNamed(Routes.HELPCENTER);
                          }),
                          customBottomView(AssetsPath.icInfoCircle, AppText.termCondition,() {
                            Get.toNamed(Routes.TERMANDCONDITION);
                          }),
                          customBottomView(AssetsPath.icPrivacyPolicy, AppText.privacyPolicy,() {
                            Get.toNamed(Routes.PRIVACYPOLICY);
                          }),
                          customBottomView(AssetsPath.icAboutUs, AppText.aboutUs,() {
                            Get.toNamed(Routes.ABOUTUS);
                          }),
                          const SizedBox(height: 20,),
                          controller.userId.isEmpty ? Container() : commonButtonWithBoarder(title: AppText.logOut),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  customTopView(String image,String title,Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: AppColor.mainTextColor.withOpacity(0.15),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 12,),
              Image.asset(
                image,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8,),
              Text(
                title,
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.mainTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customBottomView(String image, String title,Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.greyLightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    height: 24,
                    width: 24,
                    color: AppColor.mainTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              Text(
                title,
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.mainTextColor,
                ),
              ),
              title == AppText.rewards ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColor.yellowMidColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 2,),
                      Image.asset(
                        AssetsPath.mftCoin,
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 4,),
                      Text(
                        "200",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(width: 5,),
                    ],
                  ),
                ),
              ) : Container(),
              Expanded(child: Container()),
              Image.asset(
                AssetsPath.chevronRight,
                height: 20,
                width: 20,
                color: AppColor.easternBlueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
