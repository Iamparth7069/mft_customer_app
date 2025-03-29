import 'package:customer_app/app/modules/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../theme/app_style.dart';

// ignore: must_be_immutable
class NotificationAvailable extends StatelessWidget {
  NotificationController notificationController;
  NotificationAvailable(this.notificationController, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Divider(
            color: AppColor.dividerColor,
          ),
        );
      },
      shrinkWrap: true,
      itemCount: notificationController.item.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 17),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      notificationController.item[index].image,
                      height: 60,
                      width: 60,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return const SizedBox(
                          height: 60,
                          width: 60,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationController.item[index].title,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.midTextColor,
                        ),
                      ),
                      Text(
                        notificationController.item[index].description,
                        style: AppStyle.textStyleOutfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                notificationController.item[index].time,
                style: AppStyle.textStyleOutfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
              ),
            ],
          ),
        );
    },);
  }
}
