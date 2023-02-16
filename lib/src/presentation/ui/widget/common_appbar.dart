import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/app_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CommonAppBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onBack ??
            () {
              if (AppNavigator.canGoBack) {
                AppNavigator.goBack();
              }
            },
        child: Center(
          child: Assets.images.icArrowLeft.svg(
            color: ColorName.greyAEBDD4,
          ),
        ),
      ),
      title: Text(title),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 52.h);
}
