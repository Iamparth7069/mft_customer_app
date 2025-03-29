import 'package:customer_app/app/modules/notification/screens/widgets/empty_notification.dart';
import 'package:customer_app/app/modules/notification/screens/widgets/notification_available.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.notification,
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          if(controller.item.isNotEmpty){
            return const EmptyScreen();
          }else{
            return NotificationAvailable(controller);
          }
        },
      )
    );
  }
}
