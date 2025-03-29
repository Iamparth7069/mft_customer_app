import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/assets_path.dart';

class CustomSubExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final List<Widget> children;
  final Color backgroundColor;
  final Function(bool)? onExpansionChanged;

  const CustomSubExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.leading = const Icon(Icons.keyboard_arrow_right),
    this.backgroundColor = Colors.white,
    this.onExpansionChanged,
  });

  @override
  CustomSubExpansionTileState createState() => CustomSubExpansionTileState();
}

class CustomSubExpansionTileState extends State<CustomSubExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (widget.onExpansionChanged != null) {
                  widget.onExpansionChanged!(_isExpanded);
                }
              });
            },
            child: SizedBox(
              height: 24,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2,right: 8),
                    child: Image.asset(
                      _isExpanded ? AssetsPath.chevronUp : AssetsPath.down,
                      height: 20,
                      width: 20,
                      color: !_isExpanded ? AppColor.greyLightIconColor : AppColor.mainTextColor,
                    ),
                  ),
                  widget.title,
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 28,right: 16),
              child: Container(
                color: widget.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
