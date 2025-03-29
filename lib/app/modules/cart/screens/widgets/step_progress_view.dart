import 'package:flutter/material.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../theme/app_style.dart';
import 'dotted_line.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          steps.length, (index) {
        bool isLastItem = index == steps.length - 1;
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 5),
              currentStep >= index ?
                currentStep == index ?
                  Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: AppColor.lightBlueColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: AppColor.easternBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ) ,
                ) :
                Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: AppColor.successColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      size: 12,
                      color: AppColor.whiteColor,
                    )
                  ],
                ) ,
              ) :
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: AppColor.lightBlueColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                steps[index],
                style: AppStyle.textStyleOutfit(
                  color: currentStep >= index ? AppColor.mainTextColor : AppColor.midTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 2),
              isLastItem ? Expanded(child: Container()) : Expanded(
                child: SizedBox(
                  height: 1,
                  child: CustomPaint(
                    painter: DottedLinePainter(
                      dotSpacing: 5.0,
                      dotRadius: 3.0,
                      dashLength: 5.0,
                      dotColor: AppColor.lineDarkBoarderColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}