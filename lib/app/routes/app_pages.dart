import 'package:customer_app/app/modules/address/screens/add_address_screen.dart';
import 'package:customer_app/app/modules/cart/screens/cart_screen.dart';
import 'package:customer_app/app/modules/forgot_password/screens/forgot_password_screen.dart';
import 'package:customer_app/app/modules/login/screens/login_screen.dart';
import 'package:customer_app/app/modules/mft_wallet/screens/success.dart';
import 'package:customer_app/app/modules/product/screens/product_list_screen.dart';
import 'package:customer_app/app/modules/registration/screens/registration_screen.dart';
import 'package:customer_app/app/modules/success/screens/success_screen.dart';
import 'package:customer_app/app/modules/registration/screens/verify_email_screen.dart';
import 'package:get/get.dart';
import '../modules/about_us/screens/about_us_screen.dart';
import '../modules/address/screens/delivery_address_screen.dart';
import '../modules/address/screens/edit_address_screen.dart';
import '../modules/adds_on/screens/adds_on_screen.dart';
import '../modules/cart/screens/order_success_screen.dart';
import '../modules/chat_with_us/screens/chat_with_us_screen.dart';
import '../modules/coupon/screens/coupon_screen.dart';
import '../modules/dashboard/screens/dashboard_screen.dart';
import '../modules/edit_profile/screens/edit_profile_screen.dart';
import '../modules/forgot_password/screens/new_password_screen.dart';
import '../modules/help_center/screens/complaint_success_screen.dart';
import '../modules/help_center/screens/help_center_screen.dart';
import '../modules/home/screens/delivery_cities_screen.dart';
import '../modules/introduction/screens/introduction_screen.dart';
import '../modules/login/screens/password_screen.dart';
import '../modules/mft_wallet/screens/mft_wallet_screen.dart';
import '../modules/myReview/screens/my_review_screen.dart';
import '../modules/no_internet/screens/no_internet_screen.dart';
import '../modules/notification/screens/notification_screen.dart';
import '../modules/order_page/screen/order_screen.dart';
import '../modules/order_tracking/screens/order_tracking_screen.dart';
import '../modules/privacy_policy/screens/privacy_policy_screen.dart';
import '../modules/product_detail/screens/product_detail_screen.dart';
import '../modules/registration/screens/mobile_verification_screen.dart';
import '../modules/reward/screens/reward_screen.dart';
import '../modules/search_product/screens/search_product_screen.dart';
import '../modules/splash/screens/splash_screen.dart';
import '../modules/term_and_condition/screens/term_and_condition_screen.dart';
import '../modules/tracking/screen/order_tracking1_screen.dart';
import '../modules/wishlist/screens/wishlist_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroductionScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: _Paths.VERIFYEMAIL,
      page: () => const VerifyEmailScreen(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationScreen(),
    ),
    GetPage(
      name: _Paths.MOBILEVERIFICATION,
      page: () => const MobileVerificationScreen(),
    ),
    GetPage(
      name: _Paths.PASSWORD,
      page: () => const PasswordScreen(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORD,
      page: () => const NewPasswordScreen(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessScreen(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashBoardScreen(),
    ),
    GetPage(
      name: _Paths.DELIVERYCITIES,
      page: () => const DeliveryCitiesScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCTLIST,
      page: () => const ProductListScreen(),
    ),
    GetPage(
      name: _Paths.SEARCHPRODUCT,
      page: () => const SearchProductScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => const ProductDetailScreen(),
    ),
    GetPage(
      name: _Paths.ADDSON,
      page: () => const AddsOnScreen(),
    ),
    GetPage(
      name: _Paths.DELIVERYADDRESS,
      page: () => const DeliveryAddressScreen(),
    ),
    GetPage(
      name: _Paths.ADDADDRESS,
      page: () => const AddAddressScreen(),
    ),
    GetPage(
      name: _Paths.EDITADDRESS,
      page: () => const EditAddressScreen(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => const CouponScreen(),
    ),
    GetPage(
      name: _Paths.ORDERSUCCESS,
      page: () => const OrderSuccessScreen(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderScreen(),
    ),
    GetPage(
      name: _Paths.ORDERTRACK,
      page: () => const OrderTracking(),
    ),
    GetPage(
      name: _Paths.ORDERTRACK1,
      page: () => const OrderTracking1(),
    ),
    GetPage(
      name: _Paths.MYREVIEW,
      page: () => const MyReviewScreen(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishListScreen(),
    ),
    GetPage(
      name: _Paths.CHATWITHUS,
      page: () => const ChatWithUsScreen(),
    ),
    GetPage(
      name: _Paths.MFTWALLET,
      page: () => const MftWalletScreen(),
    ),
    GetPage(
      name: _Paths.SUCCESSPAGE,
      page: () => const SuccessPage(),
    ),
    GetPage(
      name: _Paths.REWARD,
      page: () => const RewardScreen(),
    ),
    GetPage(
      name: _Paths.HELPCENTER,
      page: () => const HelpCenterScreen(),
    ),
    GetPage(
      name: _Paths.COMPLAINTSUCCESS,
      page: () => const ComplaintSuccessScreen(),
    ),
    GetPage(
      name: _Paths.TERMANDCONDITION,
      page: () => const TermAndConditionScreen(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: _Paths.NOINTERNET,
      page: () => const NoInternetScreen(),
    ),
  ];
}
