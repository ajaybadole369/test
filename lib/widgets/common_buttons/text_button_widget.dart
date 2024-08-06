import 'package:flutter/material.dart';

import '../../utils/color_picker.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../common_progress_indicator_widget.dart';
import '../common_text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String btnName;
  final Color btnColor;
  final Color? loaderColor;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isLoading;
  final bool isUnderline;

  const TextButtonWidget({
    super.key,
    this.btnColor = primaryLabelColor,
    this.loaderColor,
    required this.onPressed,
    required this.btnName,
    this.fontWeight = FontWeight.w400,
    this.fontSize = NumberConstants.d16,
    this.isLoading = isFalse,
    this.isUnderline = isFalse,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? () {} : onPressed,
      style: TextButton.styleFrom(
          elevation: NumberConstants.d2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NumberConstants.d8))),
      child: isLoading
          ? CommonProgressIndicatorWidget(
              color: loaderColor ?? kWhite,
              height: NumberConstants.d20,
              width: NumberConstants.d20)
          : CommonTextWidget(
              isUnderline: isUnderline,
              text: btnName,
              textAlign: TextAlign.center,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: btnColor),
    );
  }
}
