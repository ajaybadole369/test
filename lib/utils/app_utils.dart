import 'package:demo_project/utils/color_picker.dart';
import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../extension/sized_box_extension.dart';
import '../widgets/common_progress_indicator_widget.dart';
import 'constants/number_constants.dart';

/// NAVIGATION KEY

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// ANIMATION DURATION
Duration navigatorAnimationDuration =
    const Duration(milliseconds: NumberConstants.i300);

/// HIDE KEYBOARD
void hideKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

/// SHOW TOAST
void showToast(
    {String? msg,
    Color? bgColor,
    Color? textColor,
    ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: msg ?? StringConstants.empty,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? secondaryLabelColor,
      textColor: textColor ?? kWhite,
      fontSize: NumberConstants.d16);
}

Widget commonPaginationLoader(isLoadingMore) => isLoadingMore
    ? const Padding(
        padding: EdgeInsets.all(NumberConstants.d16),
        child: CommonProgressIndicatorWidget(
            height: NumberConstants.d15,
            width: NumberConstants.d15,
            color: secondaryLabelColor),
      )
    : emptySpace();

bool validateEmailStructure(String value) {
  String pattern = r'\S+@\S+\.\S+';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

FilteringTextInputFormatter alphaRegex=FilteringTextInputFormatter(RegExp("[a-z A-Z]"), allow: isTrue);
