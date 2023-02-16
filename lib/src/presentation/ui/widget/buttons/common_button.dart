import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/theme/app_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonBorderType { normal, rounded }

enum ButtonType { icon, text, iconWithText }

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonText;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final ButtonBorderType? buttonBorderType;
  final ButtonType? buttonType;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;
  final String? iconSvgPath;
  final FontWeight? fontWeight;
  final bool isRemoveShadow;
  final double? fontSize;
  final bool isDisable;

  const CommonButton({
    Key? key,
    required this.onPressed,
    this.buttonText,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.buttonBorderType = ButtonBorderType.normal,
    this.buttonType = ButtonType.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.borderColor,
    this.iconSvgPath,
    this.fontWeight,
    this.isRemoveShadow = false,
    this.fontSize,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 44.h,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: isRemoveShadow
              ? MaterialStateProperty.all(Colors.transparent)
              : null,
          elevation: isRemoveShadow ? MaterialStateProperty.all(0) : null,
          overlayColor: isRemoveShadow
              ? MaterialStateProperty.all(Colors.transparent)
              : null,
          alignment: buttonType == ButtonType.iconWithText
              ? Alignment.centerLeft
              : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                buttonBorderType == ButtonBorderType.rounded ? 20.r : 12.r,
              ),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor ?? Colors.transparent, width: 1),
          ),
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all<Color?>(
            backgroundColor ??
                (isDisable
                    ? ColorName.blue0093D5.withOpacity(.4)
                    : ColorName.blue0093D5),
          ),
        ),
        onPressed: isDisable ? () {} : onPressed,
        child: buildChild(context),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    switch (buttonType) {
      case ButtonType.icon:
        return icon ?? const SizedBox();
      default:
        return AutoSizeText(
          buttonText ?? '',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: fontWeight ?? FontWeight.w500,
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? AppConstant.mFontSize16,
              ),
          maxLines: 1,
        );
    }
  }
}
