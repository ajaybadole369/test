import 'package:flutter/material.dart';

import '../utils/color_picker.dart';
import '../utils/constants/number_constants.dart';
import '../utils/constants/string_constants.dart';

class CommonTextWidget extends StatelessWidget {
  final String? text;
  final Color color;
  final Color decorationColor;
  final FontWeight fontWeight;
  final double fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final double? lineHeight;
  final bool isUnderline;

  const CommonTextWidget(
      {super.key,
      this.text,
      this.color = primaryLabelColor,
      this.decorationColor = kWhite,
      this.isUnderline = isFalse,
      this.fontWeight = FontWeight.w500,
      this.fontSize = NumberConstants.d16,
      this.maxLines,
      this.textAlign = TextAlign.start,
      this.overflow,
      this.lineHeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? StringConstants.empty,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      textScaler: const TextScaler.linear(0.98),
      style: TextStyle(
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none,
          decorationColor: decorationColor,
          fontFamily: StringConstants.fontFamily,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: lineHeight),
    );
  }
}
