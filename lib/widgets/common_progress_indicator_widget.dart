import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_picker.dart';
import '../utils/constants/number_constants.dart';


class CommonProgressIndicatorWidget extends StatelessWidget {
  final Color color;
  final double? height;
  final double? width;

  const CommonProgressIndicatorWidget(
      {super.key, this.color = kWhite, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: width,
      height: height,
      child: buildCircularIndicator(),
    ));
  }

  buildCircularIndicator() {
    return Platform.isAndroid
        ? CircularProgressIndicator(
            color: color,
            strokeWidth: NumberConstants.d2,
          )
        : CupertinoActivityIndicator(color: color);
  }
}
