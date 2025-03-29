import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/my_review_controller.dart';

class MyReviewScreen extends StatelessWidget {
  const MyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.myReviews),
      body: GetBuilder<MyReviewController>(
        init: MyReviewController(),
        builder: (controller) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColor.dividerColor,
              );
            },
            shrinkWrap: true,
            itemCount: controller.myReviewList.length,
            itemBuilder: (context, index) {
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            height: 52,
                            width: 52,
                            child: Image.network(
                              controller.myReviewList[index].image,
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                return const SizedBox(
                                  height: 52,
                                  width: 52,
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.myReviewList[index].name,
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.mainTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                RatingBarIndicator(
                                  rating: controller.myReviewList[index].ratting,
                                  itemBuilder: (context, ind) {
                                    bool isSelected = ind < controller.myReviewList[index].ratting;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Image.asset(
                                        isSelected ? AssetsPath.icStarFill : AssetsPath.icStar,
                                      ),
                                    );
                                  },
                                  itemCount: 5,
                                  itemSize: 24.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.myReviewList[index].detail,
                          style: AppStyle.textStyleOutfit(
                            color: AppColor.midTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: AppColor.lightBlueColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    text: "Occassion: ",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: controller.myReviewList[index].occasion,
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
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: AppColor.lightBlueColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    text: "City: ",
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: controller.myReviewList[index].city,
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
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.editReview(
                              controller.myReviewList[index].ratting,
                            );
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
                                AppText.edit,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.easternBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          width: 1,
                          color: AppColor.lineDarkBoarderColor,
                          height: 12,
                        ),
                        const SizedBox(width: 10,),
                        Row(
                          children: [
                            Image.asset(
                              AssetsPath.icTrash,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 8,),
                            Text(
                              AppText.delete,
                              style: AppStyle.textStyleOutfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.errorColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }
}
