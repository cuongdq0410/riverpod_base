import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPress;

  const CustomBackButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorName.greyF0F0F0,
        ),
        child: Center(child: Assets.images.icArrowLeft.svg()),
      ),
    );
  }
}
