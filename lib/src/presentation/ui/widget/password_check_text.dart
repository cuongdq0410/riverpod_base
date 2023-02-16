import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordCheckText extends StatelessWidget {
  final bool isCheck;
  final String title;
  final EdgeInsets? margin;

  const PasswordCheckText({
    Key? key,
    required this.isCheck,
    required this.title,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          isCheck ? Assets.images.icCheck.svg() : Assets.images.icUncheck.svg(),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
