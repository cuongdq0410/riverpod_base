import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/app_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType { error, success, warning }

class DialogUtils {
  static Future<T?> showCustomBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    BoxConstraints? constraints,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      barrierColor: barrierColor,
      constraints: constraints,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.r),
          ),
          child: Material(
            color: Colors.white,
            child: child,
          ),
        );
      },
    );
  }

  static Future<T?> showCustomDialog<T>(
    Widget dialog, {
    BuildContext? context,
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) {
    return showDialog(
      barrierColor: Colors.black26,
      context: context ?? AppNavigator.currentContext!,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      builder: (context) {
        return dialog;
      },
    );
  }
}
