import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../theme/app_style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? title;
  final String? labelText;
  final TextEditingController? controller;
  final String? trailingImagePath;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final IconData? iconData;
  final bool? isObscure;
  final bool? isMobileTextField;
  final Color? color;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final bool? readOnly;
  final Color? fillColor;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    this.title,
    this.labelText,
    this.controller,
    this.trailingImagePath,
    this.keyboardType,
    this.suffix,
    this.isObscure = false,
    this.isMobileTextField = false,
    this.iconData,
    this.color,
    this.onTap,
    this.maxLines,
    this.readOnly,
    this.fillColor,
    this.maxLength,
    this.textCapitalization,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      obscureText: isObscure ?? false,
      cursorColor: AppColor.blackColor,
      readOnly: readOnly ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: '',
        fillColor: fillColor ?? AppColor.whiteColor,
        filled: fillColor != null ? true : false,
        contentPadding: const EdgeInsets.only(left: 16,top: 16,bottom: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText ?? "",
        labelStyle: AppStyle.textStyleOutfit(
          color: AppColor.midTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(maxHeight: 50,maxWidth: 50)
      ),
      style: AppStyle.textStyleOutfit(
        color: AppColor.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.multiline,
      maxLines: maxLines,
    );
  }
}

class CustomTextFieldObscureWidget extends StatelessWidget {
  final String? title;
  final String? labelText;
  final TextEditingController? controller;
  final String? trailingImagePath;
  final TextInputType? keyboardType;
  final Widget? image;
  final IconData? iconData;
  final bool? isObscure;
  final bool? isMobileTextField;
  final Color? color;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final bool? readOnly;

  const CustomTextFieldObscureWidget({
    super.key,
    this.title,
    this.labelText,
    this.controller,
    this.trailingImagePath,
    this.keyboardType,
    this.image,
    this.isObscure = false,
    this.isMobileTextField = false,
    this.iconData,
    this.color,
    this.onTap,
    this.maxLines,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.blackColor,),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(left: 15,top: 5),
        child: TextFormField(
          onTap: onTap,
          obscureText: isObscure ?? false,
          cursorColor: AppColor.blackColor,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 5),
            border: InputBorder.none,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: maxLines != null ? true : false,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: labelText ?? "",
            labelStyle: AppStyle.textStyleOutfit(
              color: AppColor.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            suffixIcon: Icon(iconData),
          ),
          style: AppStyle.textStyleOutfit(
            color: AppColor.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.multiline,
        ),
      ),
    );
  }
}