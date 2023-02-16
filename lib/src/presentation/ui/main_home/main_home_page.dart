import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/theme/app_constant.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/custom_icon_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/dialogs/bottom_sheet_dialog.dart';
import 'package:flutter_clean_architecture/src/presentation/utils/dialog_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  DialogUtils.showCustomBottomSheet(
                    context,
                    child: StartAgainBottomSheet(
                      onTapNo: () {},
                      onTapYes: () {},
                    ),
                  );
                },
                child: Text('Open bottom sheet'),
              ),
              Row(
                children: [
                  CustomIconButton(
                    title: 'Giặt là',
                    isSelected: true,
                    onTap: () {},
                  ),
                  CustomIconButton(
                    title: 'Hoá chất',
                    isSelected: false,
                    onTap: () {},
                  ),
                  CustomIconButton(
                    icon: Assets.images.icCalendar,
                    title: 'Hôm nay',
                    isSelected: false,
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 12.w),
                  CommonButton(
                    height: 31.w,
                    buttonBorderType: ButtonBorderType.rounded,
                    onPressed: () {},
                    buttonText: 'kinh doanh',
                    fontSize: AppConstant.mFontSize12,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 12.w),
                  CommonButton(
                    height: 31.w,
                    buttonBorderType: ButtonBorderType.rounded,
                    onPressed: () {},
                    buttonText: 'cẩm nang',
                    fontSize: AppConstant.mFontSize12,
                    fontWeight: FontWeight.w600,
                    backgroundColor: ColorName.greyFAFAFA,
                    textColor: ColorName.black24162B,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
