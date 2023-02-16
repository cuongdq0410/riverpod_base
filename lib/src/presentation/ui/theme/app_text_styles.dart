import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';

import 'app_constant.dart';

class AppTextStyle {
  static String fontFamily = 'SVN-Gilroy';

  static TextStyle get titleLarge => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  static TextStyle get displaySmall => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );

  static TextStyle get displayMedium => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      );

  static TextStyle get displayLarge => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      );

  static TextStyle get labelLarge => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize15,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get bodySmall => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  static TextStyle get titleMedium => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  static TextStyle get titleSmall => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      );

  static TextStyle get normal10 => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize10,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bottomNavigationTextStyle => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize9,
        fontWeight: FontWeight.w400,
        color: ColorName.greyB4C2CD,
      );

  static TextStyle get mediumSize15 => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  static TextStyle get regularSize15 => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  static TextStyle get boldSize15 => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize15,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      );

  static TextStyle get dialogTitleStyle => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: AppConstant.mFontSize18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );
}
