import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/gradient_outline_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_styles.dart';

class AppTheme extends ChangeNotifier {
  static bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    setSystemUIOverlayStyle(isLight: !_isDarkTheme);
    notifyListeners();
  }

  //Primary
  static const Color _lightPrimaryColor = ColorName.blue0093D5;

  //Background
  static const Color _lightBackgroundColor = ColorName.backgroundLighter;
  static const Color _darkBackgroundColor = ColorName.backgroundDarker;

  //Text
  static const Color _lightTextColor = ColorName.black;
  static const Color _darkTextColor = ColorName.white;

  //Icon
  static const Color _lightIconColor = ColorName.iconBlack;
  static const Color _darkIconColor = ColorName.white;

  static final TextTheme _lightTextTheme = TextTheme(
    headlineSmall: AppTextStyle.headlineSmall.copyWith(color: _lightTextColor),
    titleLarge: AppTextStyle.titleLarge.copyWith(color: _lightTextColor),
    headlineMedium:
        AppTextStyle.headlineMedium.copyWith(color: _lightTextColor),
    displaySmall: AppTextStyle.displaySmall.copyWith(color: _lightTextColor),
    displayMedium: AppTextStyle.displayMedium.copyWith(color: _lightTextColor),
    displayLarge: AppTextStyle.displayLarge.copyWith(color: _lightTextColor),
    titleMedium: AppTextStyle.titleMedium.copyWith(color: _lightTextColor),
    titleSmall: AppTextStyle.titleSmall.copyWith(color: _lightTextColor),
    bodyLarge: AppTextStyle.bodyLarge.copyWith(color: _lightTextColor),
    bodyMedium: AppTextStyle.bodyMedium.copyWith(color: _lightTextColor),
    labelLarge: AppTextStyle.labelLarge.copyWith(color: _lightTextColor),
    bodySmall: AppTextStyle.bodySmall.copyWith(color: _lightTextColor),
  );

  static final TextTheme _dartTextTheme = TextTheme(
    headlineSmall: AppTextStyle.headlineSmall.copyWith(color: _darkTextColor),
    titleLarge: AppTextStyle.titleLarge.copyWith(color: _darkTextColor),
    headlineMedium: AppTextStyle.headlineMedium.copyWith(color: _darkTextColor),
    displaySmall: AppTextStyle.displaySmall.copyWith(color: _darkTextColor),
    displayMedium: AppTextStyle.displayLarge.copyWith(color: _darkTextColor),
    displayLarge: AppTextStyle.titleMedium.copyWith(color: _darkTextColor),
    titleMedium: AppTextStyle.titleSmall.copyWith(color: _darkTextColor),
    titleSmall: AppTextStyle.bodyLarge.copyWith(color: _darkTextColor),
    bodyLarge: AppTextStyle.bodyMedium.copyWith(color: _darkTextColor),
    bodyMedium: AppTextStyle.labelLarge.copyWith(color: _darkTextColor),
    labelLarge: AppTextStyle.bodySmall.copyWith(color: _darkTextColor),
    bodySmall: AppTextStyle.bodySmall.copyWith(color: _darkTextColor),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorName.blue0093D5,
      foregroundColor: ColorName.white,
      textStyle: AppTextStyle.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      elevation: 0,
      shadowColor: Colors.transparent,
    ),
  );

  static final AppBarTheme _appBarLightTheme = AppBarTheme(
    backgroundColor: ColorName.white,
    shadowColor: Colors.transparent,
    titleTextStyle: AppTextStyle.titleMedium.copyWith(
      color: ColorName.black,
      fontWeight: FontWeight.w500,
    ),
  );
  static final AppBarTheme _appBarDarTheme = AppBarTheme(
    iconTheme: const IconThemeData(color: _darkIconColor),
    backgroundColor: ColorName.black,
    shadowColor: Colors.transparent,
    titleTextStyle: AppTextStyle.titleMedium.copyWith(
      color: ColorName.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static final BottomNavigationBarThemeData _bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    backgroundColor: ColorName.white,
    selectedItemColor: ColorName.blue0093D5,
    selectedIconTheme: const IconThemeData(color: ColorName.blue0093D5),
    unselectedItemColor: ColorName.disable,
    selectedLabelStyle: AppTextStyle.normal10.copyWith(
      color: ColorName.blue0093D5.withOpacity(0.1),
    ),
    unselectedLabelStyle: AppTextStyle.normal10,
  );

  static GradientOutlineInputBorder get defaultBorder =>
      GradientOutlineInputBorder(
        gradient: const LinearGradient(
          colors: [ColorName.blue0093D5, ColorName.blue33A3DC],
        ),
        width: 1,
        borderRadius: BorderRadius.all(
          Radius.circular(40.r),
        ),
      );

  static GradientOutlineInputBorder get unFocusOutlineInputBorder =>
      GradientOutlineInputBorder(
        gradient: LinearGradient(
          colors: [
            ColorName.grey64748B.withOpacity(.1),
            ColorName.grey64748B.withOpacity(.1),
          ],
        ),
        width: 1.6,
        borderRadius: BorderRadius.all(
          Radius.circular(40.r),
        ),
      );

  static final InputDecorationTheme _inputDecorationLightTheme =
      InputDecorationTheme(
    isDense: true,
    labelStyle: AppTextStyle.titleMedium.copyWith(color: ColorName.hintText),
    hintStyle: AppTextStyle.mediumSize15.copyWith(
      color: ColorName.hintText,
      height: 1.8,
    ),
    errorStyle: AppTextStyle.bodySmall.copyWith(color: ColorName.redE3161A),
    border: defaultBorder,
    focusedBorder: defaultBorder,
    enabledBorder: unFocusOutlineInputBorder,
    disabledBorder: defaultBorder,
    errorBorder: defaultBorder.copyWith(
      borderSide: const BorderSide(color: ColorName.redE3161A),
    ),
    focusedErrorBorder: defaultBorder.copyWith(
      borderSide: const BorderSide(color: ColorName.redE3161A),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
  );

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: _elevatedButtonThemeData,
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
    bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    textTheme: _lightTextTheme,
    appBarTheme: _appBarLightTheme,
    inputDecorationTheme: _inputDecorationLightTheme,
    fontFamily: AppTextStyle.fontFamily,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white.withOpacity(.5),
    ),
  );

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      elevatedButtonTheme: _elevatedButtonThemeData,
      cardColor: ColorName.background,
      primaryColor: _lightPrimaryColor,
      scaffoldBackgroundColor: _darkBackgroundColor,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
      appBarTheme: _appBarDarTheme,
      iconTheme: const IconThemeData(
        color: _lightIconColor,
      ),
      textTheme: _dartTextTheme,
      fontFamily: AppTextStyle.fontFamily,
      navigationBarTheme:
          const NavigationBarThemeData(backgroundColor: Colors.black));

  static void setSystemUIOverlayStyle({bool isLight = true}) {
    if (isLight) {
      if (Platform.isAndroid) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }
}
