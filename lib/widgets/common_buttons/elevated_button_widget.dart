import 'package:flutter/material.dart';

import '../../extension/sized_box_extension.dart';
import '../../utils/color_picker.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../common_progress_indicator_widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String btnName;
  final IconData? iconData;
  final FontWeight? fontWeight;
  final double? btnHeight;
  final double? btnWidth;
  final double? fontSize;
  final bool isLoading;

  const ElevatedButtonWidget(
      {super.key,
      required this.onPressed,
      required this.btnName,
      this.iconData,
      this.fontWeight,
      this.btnHeight,
      this.btnWidth,
      this.fontSize,
      this.isLoading = isFalse});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
          elevation: NumberConstants.d2,
          backgroundColor: primary,
          foregroundColor: kWhite,
          minimumSize: Size(
              btnWidth ?? double.infinity, btnHeight ?? NumberConstants.d50),
          textStyle: TextStyle(
            fontSize: fontSize ?? NumberConstants.d18,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: StringConstants.fontFamily,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NumberConstants.d8))),
      icon: iconData == null ? emptySpace() : Icon(iconData),
      label: isLoading
          ? const CommonProgressIndicatorWidget()
          : Text(btnName, textAlign: TextAlign.center),
    );
  }
}
