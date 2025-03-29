import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 32.0,
            height: 18.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(color: _circleAnimation!.value == Alignment.centerLeft
                  ? AppColor.greyLightIconColor
                  : AppColor.easternBlueColor,
              ),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? AppColor.whiteColor
                  : AppColor.easternBlueColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 2.0, bottom: 2.0, right: _circleAnimation!.value == Alignment.centerLeft ? 4.0 : 2.0, left: 4.0,
              ),
              child: Container(
                alignment:
                !widget.value ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft ) : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight),
                child: Container(
                  width: _circleAnimation!.value == Alignment.centerLeft ? 10.0 : 14.0,
                  height: _circleAnimation!.value == Alignment.centerLeft ? 10.0 : 14.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _circleAnimation!.value == Alignment.centerLeft
                        ? AppColor.greyLightIconColor
                        : AppColor.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}