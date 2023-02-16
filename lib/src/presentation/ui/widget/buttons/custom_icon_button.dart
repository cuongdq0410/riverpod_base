import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final SvgGenImage? icon;

  const CustomIconButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.margin,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: isSelected ? ColorName.blue0093D5 : ColorName.greyF5F5F5),
          padding: EdgeInsets.symmetric(vertical: 7.5.w, horizontal: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              (icon ?? Assets.images.icFilter).svg(
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : ColorName.black292D32,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : ColorName.black292D32,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
