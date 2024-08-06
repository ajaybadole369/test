import 'package:flutter/material.dart';

import '../../extension/sized_box_extension.dart';
import '../../utils/color_picker.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/string_constants.dart';

class OutlineButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String btnName;
  final IconData? iconData;
  final FontWeight? fontWeight;
  final double? btnHeight;
  final double? btnWidth;
  final double? fontSize;
  final bool isLoading;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const OutlineButtonWidget({
    super.key,
    required this.onPressed,
    required this.btnName,
    this.iconData,
    this.fontWeight,
    this.btnHeight,
    this.btnWidth,
    this.fontSize,
    this.isLoading = isFalse,
    this.backgroundColor = kWhite,
    this.foregroundColor = primary,
    this.borderColor = primary,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isLoading ? () {} : onPressed,
      style: OutlinedButton.styleFrom(
          elevation: NumberConstants.d2,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: Size(
              btnWidth ?? double.infinity, btnHeight ?? NumberConstants.d40),
          textStyle: TextStyle(
            fontSize: fontSize ?? NumberConstants.d10,
            fontWeight: fontWeight ?? FontWeight.w300,
            // fontFamily: Str.sfPro
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NumberConstants.d8)),
          side: BorderSide(color: borderColor)),
      icon: iconData == null ? emptySpace() : Icon(iconData),
      label: isLoading
          ? const CircularProgressIndicator(color: primary)
          : Text(
              btnName,
              textAlign: TextAlign.center,

              // fontSize: fontSize,
            ),
    );
  }
}
