import 'package:customer_app/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/assets_path.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final List<Widget> children;
  final Color backgroundColor;
  final String? image;
  final Function(bool)? onExpansionChanged;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.leading = const Icon(Icons.keyboard_arrow_right),
    this.backgroundColor = AppColor.whiteColor,
    this.image,
    this.onExpansionChanged,
  });

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
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
              child: Container(
                height: 88,
                decoration: BoxDecoration(
                  color: AppColor.greyLightColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.image == null || widget.image!.isEmpty ? Container() : Center(
                        child: Image.network(
                          widget.image ?? "",
                          height: 72,
                          width: 77,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const SizedBox(
                              height: 72,
                              width: 77,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            widget.title,
                            Padding(
                              padding: const EdgeInsets.only(left: 4,top: 4),
                              child: Image.asset(
                                _isExpanded ? AssetsPath.chevronUp : AssetsPath.down,
                                height: 20,
                                width: 20,
                                color: AppColor.mainTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isExpanded)
              Container(
                color: AppColor.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
