
import 'package:flutter/material.dart';

import 'color_picker.dart';
import 'constants/number_constants.dart';
import 'constants/string_constants.dart';

class AppTheme {
  ThemeData getLightTheme = ThemeData(
      useMaterial3: isTrue,
      primaryColor: primary,
      // fontFamily: Str.sfPro,
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: primary),
      // scaffoldBackgroundColor: kBlack,
      scaffoldBackgroundColor: kTransparent,
      appBarTheme: const AppBarTheme(
          foregroundColor: kWhite,
          centerTitle: isFalse,
          titleTextStyle: TextStyle(
              // fontFamily: Str.sfPro,
              fontWeight: FontWeight.w600,
              fontSize: NumberConstants.d17,
              color: kWhite),
          elevation: NumberConstants.d0,
          scrolledUnderElevation: NumberConstants.d0,
          backgroundColor: kTransparent));
}

final AppTheme appTheme = AppTheme();
