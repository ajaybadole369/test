import 'package:flutter/material.dart';

class CommonDividerWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? thickness;
  final double? endIndent;
  final double? indent;

  const CommonDividerWidget(
      {super.key,
      this.color,
      this.height,
      this.thickness,
      this.endIndent,
      this.indent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
      thickness: thickness,
      endIndent: endIndent,
      indent: indent,
    );
  }
}
