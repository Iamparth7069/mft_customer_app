import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/search_product_controller.dart';
import '../widgets/partial_matched_widget.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GetBuilder<SearchProductController>(
          init: SearchProductController(),
          builder: (controller) {
            return Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Theme.of(context).primaryColor.withOpacity(.125),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: backButton(),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                        const Expanded(child: SearchSuggestion()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: controller.searchController.text.isNotEmpty ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text(
                            AppText.suggestedSearch,
                            style: AppStyle.textStyleOutfit(
                              color: AppColor.mainTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.nameList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final option = controller.nameList.elementAt(index);
                              return InkWell(
                                onTap: (){
                                // if(widget.fromCompare){
                                //   searchProvider.setSelectedProductId(index, widget.id);
                                //   Navigator.of(context).pop();
                                // }else{
                                //   searchProvider.searchProduct(query : option.toString(), offset: 1);
                                //   onSelected(option.toString());
                                // }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetsPath.searchIcon,
                                        height: 18,
                                        width: 18,
                                        color: AppColor.easternBlueColor,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: SubstringHighlight(
                                            text: option.toString(),
                                            textStyle: AppStyle.textStyleOutfit(
                                              color: AppColor.midTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                            term: controller.searchController.text,
                                            textStyleHighlight:  AppStyle.textStyleOutfit(
                                              color: AppColor.mainTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 5.0),
                          ),
                        ],
                      ),
                    ),
                  ) : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: AppColor.darkLightColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(
                                  AppText.trendingSearches,
                                  style: AppStyle.textStyleOutfit(
                                    color: AppColor.mainTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Wrap(
                                  direction: Axis.horizontal, alignment : WrapAlignment.start,
                                  children: [
                                    for (int index = 0; index < controller.trendingSearchList.length; index++)
                                    Padding(
                                      padding:  const EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          border: Border.all(width: 1, color: AppColor.dividerColor),
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                        margin: const EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisSize:MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                controller.trendingSearchList[index].categoryName ?? "",
                                                style: AppStyle.textStyleOutfit(
                                                  color: AppColor.midTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 36,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                AppText.mostSearchedCategories,
                                style: AppStyle.textStyleOutfit(
                                  color: AppColor.mainTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              height: 120,
                              width: Get.width,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.categoryList.length,
                                  itemBuilder: (context,index){
                                    bool isLastItem = index == controller.categoryList.length - 1;

                                    return Padding(
                                      padding: EdgeInsets.only(left: index == 0 ? 20 : 5,right: isLastItem ? 20 : 0),
                                      child: SizedBox(
                                        width: 80,
                                        height: 48,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 65,
                                              width: 65,
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
                                              child: FractionallySizedBox(
                                                widthFactor: 0.6, // 80% of the parent's width
                                                heightFactor: 0.6,
                                                child: Image.network(
                                                  controller.categoryList[index].image,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                    return Container();
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 7,),
                                            Text(
                                              controller.categoryList[index].categoryName,
                                              style: AppStyle.textStyleOutfit(
                                                fontSize: 12,
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
