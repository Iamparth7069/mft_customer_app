import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_style.dart';
import 'app_color.dart';
import 'assets_path.dart';

Widget loader(){
  return const Center(child: CircularProgressIndicator(color: AppColor.blueColor,));
}

Widget commonButton({required String title,Color? color}){
  return Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(48),
      color: color ?? AppColor.mainTextColor,
    ),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyle.textStyleOutfit(
          color: AppColor.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

PreferredSizeWidget commonAppBar({
  required String title,
  Widget? trailing, // Add an optional trailing widget parameter
}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 100),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 2,
            spreadRadius: 1,
            color: Theme.of(Get.context!).primaryColor.withOpacity(.125),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: backButton(),
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: AppStyle.textStyleOutfit(
                    color: AppColor.mainTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            if (trailing != null) trailing, // Add the trailing widget if provided
          ],
        ),
      ),
    ),
  );
}

Widget commonButtonWithBoarder({required String title,Color? color}){
  return GestureDetector(
    onTap: (){
      Get.offAllNamed(Routes.LOGIN);
    },
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: color ?? AppColor.mainTextColor,width: 2),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyle.textStyleOutfit(
            color: AppColor.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

showSnackBar({
  required String message, // The message to display in the snack bar
  Duration duration = const Duration(seconds: 2), // Duration of the snack bar
  Color backgroundColor = AppColor.blackColor, // Background color of the snack bar
  TextStyle textStyle = const TextStyle(color: AppColor.whiteColor), // Style of the message text
  SnackBarAction? action, // Optional action in the snack bar
}) {
  // Use ScaffoldMessenger to show the snack bar
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: textStyle,
      ),
      duration: duration,
      backgroundColor: backgroundColor,
      action: action,
    ),
  );
}

backButton(){
  return Image.asset(
    AssetsPath.backIcon,
    height: 14,
  );
}

Widget heading({required String title,required bool isShow,Null Function()? onTap}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppStyle.textStyleOutfit(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.mainTextColor,
        ),
      ),
      isShow ? GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              AppText.seeAll,
              style: AppStyle.textStyleOutfit(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.easternBlueColor,
              ),
            ),
            const SizedBox(width: 5,),
            Image.asset(
              AssetsPath.chevronRight,
              height: 18,
              width: 18,
              color: AppColor.easternBlueColor,
            ),
          ],
        ),
      ) : Container(),
    ],
  );
}

String getEmailOrMobile(String input) {
  // Regular expression for validating an email
  final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
  );

  // Regular expression for validating a mobile number (simple example)
  final RegExp mobileRegExp = RegExp(
      r"^\d{10}$"
  );

  if (emailRegExp.hasMatch(input)) {
    return "Email";
  } else if (mobileRegExp.hasMatch(input)) {
    return "Mobile";
  } else {
    return "Invalid";
  }
}


Color extractColorFromCss(String cssString) {
  final RegExp colorRegex = RegExp(r'#([0-9a-fA-F]{6})');
  final match = colorRegex.firstMatch(cssString);
  if (match != null) {
    String colorHex = match.group(0)!;
    return Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000); // Ensure alpha is 255 (opaque)
  } else {
    return Colors.transparent; // Default to transparent if no valid color found
  }
}