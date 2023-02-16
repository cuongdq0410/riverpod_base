import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_clean_architecture/src/presentation/utils/dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartAgainBottomSheet extends StatelessWidget {
  final VoidCallback onTapNo;
  final VoidCallback onTapYes;

  const StartAgainBottomSheet(
      {Key? key, required this.onTapNo, required this.onTapYes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      height: 210.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bắt đầu lại?',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: Dimensions.mFontSize18),
          ),
          SizedBox(height: 8.w),
          Text(
            'Quay lại màn hình đầu tiên, bạn sẽ cần điền lại thông tin từ đầu',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: ColorName.grey929292,
                ),
          ),
          SizedBox(height: 20.w),
          CommonButton(
            width: double.infinity,
            onPressed: onTapNo,
            buttonText: 'Không',
          ),
          SizedBox(height: 16.w),
          CommonButton(
            width: double.infinity,
            onPressed: onTapYes,
            buttonText: 'Có',
            backgroundColor: ColorName.greyF0F0F0,
            textColor: ColorName.grey636363,
          )
        ],
      ),
    );
  }
}
