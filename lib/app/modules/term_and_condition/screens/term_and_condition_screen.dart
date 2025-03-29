import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';

class TermAndConditionScreen extends StatelessWidget {
  const TermAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(title: AppText.termCondition),
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
                      "Please read these terms and conditions, carefully before using our application operated by us",
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
                  step1(),
                  const SizedBox(height: 20,),
                  step2(),
                  const SizedBox(height: 20,),
                  step3(),
                  const SizedBox(height: 20,),
                  step4(),
                  const SizedBox(height: 20,),
                  step5(),
                  const SizedBox(height: 12,),
                  commonText("Because of the perishable nature of most products and in order to assist you in resolving issues quickly and to our mutual satisfaction, we advise you to make your complaints within 24 hours from the date of delivery or intended delivery of your purchase.",0,),
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
        titleText("1. Product",),
        unorderedListText("All products as shown on this website are subject to availability (as may be varied from time to time).",),
        unorderedListText("In the event of any supply difficulties, we reserve the right to substitute with a product of equivalent value and quality without notice.",),
        unorderedListText("Certain flowers and plants may be delivered in \"bud\" to ensure longer life.",),
        unorderedListText("In the event that we are unable to supply all or part of your order (the product or any substitute product to you at all), we shall notify you as soon as possible and reimburse your payment in full not later than 30 days after the intended delivery date.",),
      ],
    );
  }

  step2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("2. Delivery",),
        unorderedListText("By placing an order at our website, you are consenting to be bound by our terms and conditions contained in these Terms and Conditions and appearing anywhere on MyFlowerTree website.",),
        unorderedListText("Your submitting of the order is subject to our acceptance of the offer. We will send an email confirmation of your order details to advise that we are processing your order via the email address you provide.",),
        unorderedListText("We will not consider ourselves bound by a contract with you in any given situation.",),
        unorderedListText("Deliveries via courier services cannot be delivered at specific times. All orders will be delivered during the working day between 9am and 7pm.",),
        unorderedListText("In case of a delivery not possible on public holidays or local restriction, orders will be delivered on the next working day.",),
        unorderedListText("To avoid problems or delays with delivery, please ensure that you have included complete address, including accurate postcode of the intended recipient and telephone number, together with your daytime contact number or e-mail address so that we can inform you if any delivery problems are encountered.",),
        unorderedListText("If, for any reason, you wish to change or cancel your order, you can easily do so by calling +91 01246882705 (08:00 am - 11:00 pm) or CLICK HERE.",),
        unorderedListText("Please give us at least 48 hours notice before the requested delivery date.",),
        unorderedListText("Orders cannot be canceled or modified within 48 hrs from delivery date.",),
        unorderedListText("Delivery confirmation for all midnight deliveries will be notified the next day before 10:00 am.",),
        unorderedListText("Our custom delivery options are as follows: Early Morning Delivery: 7:00 am - 9:00 am Fixed Time Slot Delivery: 10:00 am - 10:00 pm Standard Delivery: 8:00 am - 9:00 pm (4 time slots are available) Midnight Delivery: 11:00 PM - 12:00 AM",),
        unorderedListText("We take preference \"Preferred Delivery Time\" from customer, it is for your convenience and we make our best efforts to deliver your order within \"preferred timeline\" however this is not guaranteed and may not always be possible.",),
        unorderedListText("During peak holidays, festivals or events, our customer service agents may not be able to provide immediate delivery confirmation. However, please be assured that our team is working hard to get your orders delivered as soon as possible.",),
        unorderedListText("If the recipient is not found at home / office, your gift will be delivered to the neighbour, or security. At reception (in case of office), your order will be considered as delivered and we will not be responsible for any damage or loss of items. If recipient's number is incorrect, not responding, or is unavailable, the delivery may not be possible and as such the recipient must collect the order from our delivery center within 24 hrs. from scheduled delivery time.",),
        unorderedListText("If, for any reason, the delivery is \"refused by recipient\", the order will be considered as delivery attempted and no refund / change of order is acceptable in this case. We, however, will try our best to convince the recipient for accepting the delivery.",),
        unorderedListText("All items ordered under \"GIFTS\" category are shipped using FedEx or equivalent courier. As such we cannot specify any delivery timings, all orders will be delivered between 9:00 am - 7:00 pm and may take 3-5 days of shipping time depending on the product, availability and other parameters. Please notice \"Earliest Date of Delivery\" specified on product description page. If you have ordered multiple products and selected a date of delivery earlier than available date, other products such as flowers and cakes will be delivered on selected date and gifts will be shipped at the earliest possibility.",),
      ],
    );
  }

  step3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("3. Refund",),
        unorderedListText("A refund can only be requested in case of service failure. Our team will evaluate whether an order qualifies for a refund and decision of the management will be final. Under no circumstances will the refund amount can exceed the amount paid by customer. We are not liable for any loss or claim beyond the amount actually paid by customer.",),
        unorderedListText("Our team works very hard to deliver finest quality and service experience to its customers. For us, our customer and business is most important and we really care about delivering the best.",),
        unorderedListText("In rare case of service failure or quality complaint, you can write HERE and our team will respond to you within 8-12 working hours.",),
        unorderedListText("Our team will process a quick investigation on your order and in case of any quality / service failure found, we assure to re-deliver your product with complimentary flowers within next 24 hrs.",),
        unorderedListText("While we really understand \"Message on Card\" and \"Message on Cake\" is extremely important to be accompanied with flowers and gifts. However, due to large number of complexities, we unfortunately do not guarantee the accuracy and delivery of such messages. It goes without saying that every possible care and attention is taken to ensure we do not miss on these messages. However, we will not take any guarantee about spelling mistakes or missing message on the cakes. What's best here is that we rarely miss your messages. And in cases, usually our support team goes that extra mile to assist and take care of your every order complaint and concerns and makes an extra effort to put things right as and when possible.",),
        unorderedListText("No refund possible in valentine week.",),
      ],
    );
  }

  step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("4. PayPal cashback offer",),
        commonText("PayPal is the sole authority of the offer and MyFlowerTree shall not be liable for any loss or damage arising due to it. Please click here to check terms & conditions of the offer.",16,),
      ],
    );
  }

  step5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("5. Customer service desk",),
        commonText("In the event that you are not satisfied with our service, any complaints or suggestions should be addressed to: Call us: +91 01246882705 (8:00 am - 11:00 pm) IST only",16,),
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
