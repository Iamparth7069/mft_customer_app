import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_string.dart';
import '../../../../../theme/app_style.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsPath.notification3D,
            height: 146,
            width: 132,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            AppText.notificationNoFound,
            style: AppStyle.textStyleOutfit(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.mainTextColor,
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              AppText.notificationNodesription,
              style: AppStyle.textStyleOutfit(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.midTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
