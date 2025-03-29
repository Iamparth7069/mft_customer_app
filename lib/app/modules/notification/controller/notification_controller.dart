import 'package:get/get.dart';

import '../model/item.dart';

class NotificationController extends GetxController{

  List<Item> item = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    item.add(Item("https://s3-alpha-sig.figma.com/img/6954/1979/a1d141bf65e48462d45a351ca2430ec0?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YI--UTugWnpB6iprG0W44YG8R7KPKvPLvWiwdIsyrlMmLAJtuiDgd5pr0SG7OkQj-OJKnj1jb4-qOKHj5RYSitsN06XH1qOBfb4pwXoKtdg24ooKG~HaJoMIJxwQBonnChigs2P~gjdVNmHkf0-inKw9JjWlJnZOep7FU0N9dRQqEOS40UFS0iTzMeOJ2Ux8S-4h6WYmnsqDL~BSbMWi3iOINbv5q8PFq9fOnuLY~sSCG1zvUeleK9Damg0YdsYuddSfioriOhg8EkL~FQh3cfPQND-vJpbKGvLXgZbPpxJhBy-fj4CD-XPUlnbjUfrmyf3dvyYl-JUx8BRMHJWGjg__", "Top-notch gift picks!", "Up to 30% off on flowers", "2 hours ago"));
    item.add(Item("https://s3-alpha-sig.figma.com/img/ab0b/d16a/a93734e6ece3c2d5d75bae12304d9cc9?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VnCFtBCIitqsheFnVOsUw8gxuZJP1O2qr4OF07V7B13SjgYeeGVH7XPGLwHk0gJstpciDckmLGqAotJiDnXCM9aXapmffagnLjC6GyS8Lp7X~VslrFo9m3boMTVx-Mu46jnH6GQuB~iaDixqdKNOZcOp5qZybia4wAFwjh4zEKO4ZB7Pqz0Z5~ySk7cq4Vc1tsN6gmbXZfkpD8YuQBgMo70scs1075RGivKEaZ4zlk7Du4dFB9y6WjdXEDSkuhovupw9lBLjWh4Fyr~1alrc9SVg~ljd-F3GopAl2r9WTBi~pn9THRemHU8-LYgsaadX625o54ALcmEqYq6PCOSBRw__", "Items in focus", "Chocolate Cake @ Min 20% off", "2 hours ago"));
    item.add(Item("https://s3-alpha-sig.figma.com/img/7b47/379b/60a881abdd93234fefdc065d59e0c304?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mIaVHgXuxWcVhNxvF3tL0YdsZM086v2s8rE2~3Jm3rIlWwQk9vsXxpN8BxBN8-pJ-XQwPnBz3aiA4ycH8A5jkak34utLSHCCZ84330GvKlVl-IQpmkuklxLMdzMJEcgbMz5Yo4UrJcwjv75nsf06HRm39vRvcWNcxzUKillv4YQQwt1o2UhCcDXzax6OZNQYHOiN7IZj8gUdS6jjpxAZ~vIKs-30MYP48exe3~Fjl2NF-Iyt6EFXiYYbFCB88Ke96T0-yfLe3qPYVnhdH0lF2zmsCWorg1aX14PH2xm5EBIElYK-62mJlT8d-M-SRYAD1YcUGalJbSqt934WH0d2kQ__", "Give gift on Mothersday", "Special 30% off on mothers day", "4 day ago"));
  }
}