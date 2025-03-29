import 'package:customer_app/constants/assets_path.dart';
import 'package:customer_app/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../controller/reward_controller.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.rewards,
      ),
      body: GetBuilder<RewardController>(
        init: RewardController(),
        builder: (controller) {
          return (controller.isLoading && controller.data.isEmpty) ? loader() : SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 104,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        AppColor.pinkColor1.withOpacity(0.5),
                        AppColor.pinkColor1.withOpacity(0.01),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetsPath.gift,
                              height: 48,
                              width: 48,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Reward points",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetsPath.mftCoin,
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 7,),
                                    Text(
                                      controller.totalBalance,
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          AssetsPath.gift1,
                          height: 77,
                          width: 77,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions",
                        style: AppStyle.textStyleOutfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.lineDarkBoarderColor, // Border color
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: controller.selectedValue,
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   _selectedValue = newValue!;
                            // });
                          },
                          underline: const SizedBox(),
                          // Remove the default underline
                          isExpanded: false,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainTextColor,
                          ),
                          // Expand to fill the container's width
                          items: [
                            DropdownMenuItem<String>(
                              value: 'May 2024',
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'May 2024',
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'June 2024',
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'June 2024',
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'July 2024',
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'July 2024',
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Divider(
                          color: AppColor.dividerColor,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.data[index].description ?? "",
                                  style: AppStyle.textStyleOutfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.mainTextColor,
                                  ),
                                ),
                              ),
                              Text(
                                controller.data[index].points ?? "",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Text(
                            controller.data[index].dateAdded ?? "",
                            style: AppStyle.textStyleOutfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.midTextColor,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (controller.isFetchingNewPage)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: loader(),
                  ),
              ],
            ),
          );
        }
      )
    );
  }
}
