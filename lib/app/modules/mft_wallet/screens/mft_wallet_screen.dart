import 'package:customer_app/app/modules/mft_wallet/controller/mft_wallet_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class MftWalletScreen extends StatelessWidget {
  const MftWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.mftWallet,
      ),
      bottomSheet:  Container(
        height: 72,
        color: AppColor.whiteColor,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.mainTextColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, -4), // changes position of shadow to top
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.SUCCESSPAGE);
                  },
                  child: commonButton(title: AppText.payRechargeWallet),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<MftWalletController>(
        init: MftWalletController(),
        builder: (controller) {
          return (controller.isLoading && controller.data.isEmpty) ? loader() : SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    // Ensures the container takes the full available width
                    child: Stack(
                      fit: StackFit.expand, // Ensures the Stack fits the container
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.mainTextColor,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AssetsPath.walletCircle,
                              height: 90,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          bottom: 34,
                          right: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            // Optional: Adjust the corner radius as needed
                            child: Image.asset(
                              AssetsPath.mftWallet,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.mftWallet,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Text(
                                AppText.yourBalance,
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              Text(
                                "₹${controller.totalBalance}",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: AppColor.greyLightColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.enterYourOwnAmount,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Container(
                          color: AppColor.whiteColor,
                          child: TextFormField(
                            controller: controller.amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppText.get,
                                    style: AppStyle.textStyleOutfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.midTextColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "₹500.00",
                                      style: AppStyle.textStyleOutfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColor.lineDarkBoarderColor,
                                  width: 2.0,
                                ), // Focused border color
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColor.lineDarkBoarderColor,
                                  width: 1.0,
                                ), // Unfocused border color
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColor.lineDarkBoarderColor,
                                ), // Disabled border color
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          AppText.earnCashback,
                          style: AppStyle.textStyleOutfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.midTextColor,
                          ),
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
                        AppText.transactions,
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
                              Text(
                                controller.data[index].transaction ?? "",
                                style: AppStyle.textStyleOutfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.mainTextColor,
                                ),
                              ),
                              Text(
                                controller.data[index].runningBalance ?? "",
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
                const SizedBox(height: 80,),
              ],
            ),
          );
        }
      ),
    );
  }
}
