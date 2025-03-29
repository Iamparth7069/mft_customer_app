import 'package:flutter/material.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../theme/app_style.dart';
import '../../model/step_data.dart';
import 'package:customer_app/app/modules/tracking/controller/order_tracking1_controller.dart';

// ignore: must_be_immutable
class CustomSteps extends StatelessWidget {
  final int _currentStep = 2; // Set the current active step index
  final bool checkStatus = true;

  OrderTracking1Controller? _orderTracking1Controller;

  // Constructor with optional _orderTracking1Controller parameter
  CustomSteps({super.key, OrderTracking1Controller? orderTracking1Controller}) {
    _orderTracking1Controller = orderTracking1Controller;
  }

  @override
  Widget build(BuildContext context) {
    final List<StepData> steps = checkStatus
        ? [
      StepData(
        title: 'Order placed',
        content: 'Order created on 5 May 2024 | 2:15:24 pm',
        isActive: _currentStep >= 0,
        isCompleted: _currentStep > 0,
      ),
      StepData(
        title: 'Cancelled',
        content: 'Order cancelled on 5 May 2024 | 2:45:00 pm',
        isActive: _currentStep >= 1,
        isCompleted: _currentStep > 1,
      ),
    ]
        : [
      StepData(
        title: 'Order placed',
        content: 'Order created on 5 May 2024 | 2:15:24 pm',
        isActive: _currentStep >= 0,
        isCompleted: _currentStep > 0,
      ),
      StepData(
        title: 'Picked up',
        content: 'Shipment picked up on 5 May 2024 | 3:15:00 pm',
        isActive: _currentStep >= 1,
        isCompleted: _currentStep > 1,
      ),
      StepData(
        title: 'Shipped',
        content: 'Order shipped on 5 May 2024 | 5:00:30 pm',
        isActive: _currentStep >= 2,
        isCompleted: _currentStep > 2,
      ),
      StepData(
        title: 'Delivery',
        content: 'Delivered to you on 5 May 2024 | 8:15:30 pm',
        isActive: _currentStep >= 3,
        isCompleted: _currentStep > 3,
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _orderTracking1Controller!.orderDetails!.result.express.trackingData.length,
      itemBuilder: (context, index) {
        final step = _orderTracking1Controller!.orderDetails!.result.express.trackingData[index];
        return _buildStep(
          context,
          stepIndex: index,
          title: step.message,
          content: step.date,
          classtype: step.classType,
          steps: steps,
        );
      },
    );
  }

  Widget _buildStep(
      BuildContext context, {
        required int stepIndex,
        required String title,
        required String content,
        required String classtype,
        required List<StepData> steps,
      }) {
    Color circleColor;
    if (classtype == 'deactive') {
      circleColor = AppColor.errorColor;
    } else {
      circleColor = AppColor.successColor;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Center(
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: circleColor,
                ),
              ),
            ),
            if (stepIndex < steps.length - 1)
              Container(
                width: 2,
                height: 40,
                color: AppColor.successColor,
              ),
          ],
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyle.textStyleOutfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.mainTextColor,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                content,
                style: AppStyle.textStyleOutfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.midTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
