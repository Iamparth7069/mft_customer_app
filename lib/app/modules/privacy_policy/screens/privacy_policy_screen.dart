import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.privacyPolicy),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: AppColor.lightBlueColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Late updated on January 2024",
                      style: AppStyle.textStyleOutfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.midTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Please read these Privacy policy, carefully before using our application operated by us",
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
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("(Progressive Commerce Pvt Ltd) Our platform incorporates a range of gift choices along with advanced security measures. As a service provider, we need to take part in providing high-standard secure transactions and protect your data with utmost latest technology. Undoubtedly, we won’t sell, and publish your personal info for self branding or marketing purposes in any case. The words below are how we are protecting your data and what the ways we are using.",0,),
                  const SizedBox(height: 12,),
                  commonText("Note: We may suppose to change the privacy policy anytime without any intimation. So, kindly review the changes and keep updating the status frequently.",0,),
                  const SizedBox(height: 12,),
                  commonText("Once before entering into the website and exploring, agree the given terms and conditions without fail. If you are not ready to keep those points, we request you to stay away from accessing the website.",0,),
                  const SizedBox(height: 12,),
                  commonText("This lengthy privacy policy makes you understand the actual practices that we are following all the time. Such given policies and methods are applicable only for the domain and subdomains of (MyFlowerTree.com) that determines the security of data given by the customers. We made these entire terms and conditions only by thoroughly looking into the law determined for online gift shopping sites. The mentioned privacy policies are subject to provision throughout the MyFlowerTree site even for every set of pages.",0,),
                  const SizedBox(height: 12,),
                  commonText("By agreeing the user agreement and privacy policy we estimated, you are supposed to accept this user agreement. This is quite new and effective among the fresh registering users of MyFlowerTree.",0,),
                  const SizedBox(height: 20,),
                  step1(),
                  const SizedBox(height: 20,),
                  step2(),
                  const SizedBox(height: 20,),
                  step3(),
                  const SizedBox(height: 20,),
                  step4(),
                  const SizedBox(height: 20,),
                  step5(),
                  const SizedBox(height: 20,),
                  step6(),
                  const SizedBox(height: 20,),
                  step7(),
                  const SizedBox(height: 20,),
                  step8(),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  step1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("1. Your privacy – Our extreme priority"),
        unorderedListText("We, MyFlowerTree are extremely glad to inform you that we are providing the utmost safe and secure environment to do the purchase. Earning customer response and trustworthiness matters a lot and we made it successfully. Without any inconveniences, we allow you to use our services anytime and anywhere to add value to your celebration."),
        unorderedListText("The providing services are extremely good and effective as you can recommend your friends and families to make a visit for a better experience. As we are not profit minded to leave your data just like that, hence it has been protected as much as an updated version of securities. However, give a glance to the following privacy policies as it helps to understand the actual practices of our site."),
      ],
    );
  }

  step2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("2. Date or info we gathers"),
        unorderedListText("We hardly respect the private info of our users and do the maximum possibilities to protect them from threat."),
        unorderedListText("a) First of all, we require your info only for the below list of reasons that every must know:\nTo dispatch the order at the prescribed date and time\nTo verify or validate the customer info\nTo give an instant update regards offers and discounts\nTo promote the services of MyFlowerTree"),
        unorderedListText("b) When placing your order at our site, we need a certain set of details to collect and authenticate such as:\nName\nActual Address\nEmail Address\nAge\nSex\nPayment details\nPhone Number"),
        unorderedListText("c) All those details that you are sharing with us will be delivered to our distribution providers and banking services for ensuring that your order has successfully placed and dispatch at your end successfully. Most importantly, only the relevant info has been shared to such people based on their duties and responsibilities."),
        unorderedListText("d) Once after the dropping your order, you won’t receive any email or call from our end unless you give us consent. We also request you to write an email, if you wish to delete or remove any personal info of yours from our end for ensuring your safety."),
        unorderedListText("e) We never demand the customers to share the sensitive information while visiting our site. So, we request to ensure all those things before submitting."),
        unorderedListText("f) For every new visitor, we provide a certain set of information automatically like how to use our website and drop your order. In order to accept those details, we use a concept called cookie to guide you instantly."),
        unorderedListText("g) Still, do you have any queries or doubts regarding this privacy policy kindly write an email to us “support@myflowertree.com”"),
      ],
    );
  }

  step3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("3. Why we collect the info of yours?",),
        commonText("Foremostly, to understand your requirements and serve such requesting services we need your info all the time. Apart from that, once the data has been collected at your end, we save it for managing some kind of activities like resolve disputes, estimating customer interest towards our services, troubleshoot the problems instantly, provide actual services you required from us, to detect the error and protect ourself, customize your experiences, and a lot more to say.",16,),
        commonText("Every day, we meet thousands and lakhs of customers from different locations and many will approach us for seeking help while dropping their orders. In that case, we need their personal info to find and resolve their issues without making a delay. Our professionals will compare your queries and personal info for providing the actual solution within a certain set of time limit.",16,),
        commonText("Next to that, we have to access your address and billing information to finalize your payment and bill you. As we said earlier, sometimes the information will be accessed for promotional and marketing strategies that are also with a motive of providing even better customer support and services as per your need. It helps to improve our site performance and let the users do their purchase in a smooth and secured way.",16,),
        commonText("This is to agree that your info will surely be accessed to contact and deliver the package within a desired time and address. In some cases, by considering your research at our site some advertisements and notices have been sent to you. This is clearly mentioned in our privacy policy too and if you are not supposed to entertain such kind of activities you have full rights to make changes in your profile at any time.",16,),
      ],
    );
  }

  step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("4. Disclosure",),
        commonText("The entire terms and conditions we have determined come under the law as we have done maximum possibilities to protect your data from third party access. Though we are using info for promotions and marketing that will not bring any kind of security issues at your side. As we confirmed earlier, none of the sensitive info were collected from the customer side even during the billing and dispatching of the package.",16,),
        commonText("With this existing regulatory environment, we cant ensure that our site provides static protection to your info. We cannot assure or promise you about standard practices of protecting your personal information or private communications. In addition to that, without your consent we nowhere cross our limitations in sharing or publishing your info.",16,),
        commonText("If we decide to change this privacy policy in some cases, the changes will be updated and displayed over the same page. We may also try to intimate you about this change by email and also recommend you to check this page periodically for knowing the frequent updates.",16,),
      ],
    );
  }

  step5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("5. Our security for your information",),
        commonText("The data we collect from the users are password protected. No one will have access to your personal info without a proper reason. We limit the access of your data even to our employees and distributors of our site. Though we have come up with an enhanced security system, it is highly impossible to guarantee that your data is completely safe and protected for all the time. You may also have a chance to update your info over the internet for some other purposes, we can't give full responsibility for your personal details.",16,),
        commonText("We want to clarify to you that the users info will not be shared anywhere without a proper consent from your side, so be relaxed.",16,),
      ],
    );
  }

  step6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("6. Our modifications towards privacy policy",),
        commonText("We can modify the mentioned privacy policy in future depending upon the needs we have. The updates of the new version will be sent to you via email once we confirm at our end. The email address that you provided with us last time will be used from our side for updating the instant status. The changes may be helpful for the new users of MyFlowerTree and they may experience better services than now.",16,),
        commonText("In case, if you are not interested to receive such kind of updates or emails from our site, kindly let us know to stop providing notifications. We will deactivate your account with us for the people who do not wish to use their personal information from our site.",16,),
      ],
    );
  }

  step7() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("7. Raise your complaint",),
        commonText("At any point, if you feel that MyFlowerTree is not following these mentioned privacy policies then intimate us directly by writing an email “support@myflowertree.com”.",16,),
        commonText("We will do the investigation as much as possible and resolve it as per your queries.",16,),
      ],
    );
  }

  step8() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("8. User’s Permit",),
        commonText("For accessing the website or providing the personal information will come under the privacy policy that we have mentioned. None of the process will be executed beyond these terms and conditions. As per your consent, the personal information has been used for our purposes that also obey the legal regulation.",16,),
        commonText("If you still have any queries regarding the privacy policy of our site, contact through an email “support@myflowertree.com”",16,),
      ],
    );
  }

  titleText(String text){
    return Text(
      text,
      style: AppStyle.textStyleOutfit(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.mainTextColor,
      ),
    );
  }

  commonText(String text,double left){
    return Padding(
      padding: EdgeInsets.only(left: left,top: 8),
      child: Text(
        text,
        style: AppStyle.textStyleOutfit(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.midTextColor,
        ),
      ),
    );
  }

  unorderedListText(String text){
    return Padding(
      padding: const EdgeInsets.only(left: 16,top: 8),
      child: UnorderedListItem(text),
    );
  }

}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: AppStyle.textStyleOutfit(
            color: AppColor.midTextColor,
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Text(
            text,
            style: AppStyle.textStyleOutfit(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.midTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
