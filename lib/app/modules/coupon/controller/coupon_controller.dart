import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/coupon_model.dart';

class CouponController extends GetxController {
  TextEditingController couponController = TextEditingController();
  List<Coupon> couponList = [
    Coupon(name: "Save 5%",offer: "Get 5% off",description: "Get 5% off on prepaid payment"),
    Coupon(name: "CH100",offer: "Get ₹100 off",description: "Get ₹100 off on payment of min ₹2000 order"),
  ];
}