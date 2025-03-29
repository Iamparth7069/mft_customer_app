import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../model/my_review_model.dart';
import '../screens/widget/bottom_sheet_edit_review.dart';

class MyReviewController extends GetxController {

  TextEditingController writeReviewController = TextEditingController();

  List<MyReview> myReviewList = [
    MyReview(
      id: 1,
      name: "Bouquet of emotion Cake",
      image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
      ratting: 4.0,
      detail: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      occasion: "Birthday",
      city: "Bangalore",
    ),
    MyReview(
      id: 2,
      name: "Coffee chocochip cake",
      image: "https://s3-alpha-sig.figma.com/img/cb26/f3c2/3c8a728da5af5a2aac3441d83de8cac2?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FH9Cg5-jvU--o97hB7bYkUw3T6Eh-9hw5bJO1V3cmF65jUaYuhaOULvvOl0C7MkECGIC1G8~NLdASlPS2g9KskDsxs2dnNJHV5GhZTb6VI0LrCnDEOCgjJVBFVCu1qu~sNaOPkGl3cCXO9qsrJDs0j5bmHYH3FxB89CIVw4u3eHHCwRfLm9rdA6f8Y8bikc5n4fxX9XxgP~srl58Z1jbPoreA7MdZsgKE3vZyHaD1JdJa2iLv-rrRRTTr2TYJwArKwBzWeR5laV2-RcN~jhHpkF~GIxw7Uf2E-tUGAyks10PtO8RnMig5cJuGKH3AZm7H4IgOmoX4SX9wjyGzjbcXw__",
      ratting: 5.0,
      detail: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      occasion: "Birthday",
      city: "Bangalore",
    ),
  ];

  void editReview(double ratting) {
    Get.bottomSheet(
      BottomSheetEditReview(ratting: ratting,title: AppText.editReview,),
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  String getTextRatting(double ratting) {
    switch (ratting.toInt()) {
      case 1:
        return "Hated it";
      case 2:
        return "Didn’t like it";
      case 3:
        return "Was good";
      case 4:
        return "Liked it";
      case 5:
        return "Loved it";
      default:
        return "";
    }
  }

}