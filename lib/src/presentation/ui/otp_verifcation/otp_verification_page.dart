import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/domain/annotation/redirect.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_stateless_view.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/route_define.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/authorize_common_top.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/custom_back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'otp_verification_view_model.dart';

class OtpVerificationPage extends BaseStatelessView<OtpVerificationViewModel> {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  Widget createView(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              buildMain(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onPress: popScreen),
                  Consumer(
                    builder: (context, ref, _) {
                      return CommonButton(
                        isDisable: !ref.watch(viewModelProvider).isContinue,
                        onPressed: () {
                          pushScreen(RouteDefine.homePage.name);
                        },
                        buttonText: 'Tiếp tục',
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildMain(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const AuthorizeCommonTop(title: 'Đăng kí'),
            SizedBox(height: 74.h),
            const OtpWidget(),
            SizedBox(height: 26.h),
            Text(
              'Không nhận được mã?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorName.grey6F6E71,
                  ),
            ),
            Consumer(builder: (context, ref, _) {
              final otpRefWatch = ref.watch(viewModelProvider);
              final otpRefRead = ref.read(viewModelProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  otpRefWatch.second == 0
                      ? InkWell(
                          onTap: () {
                            otpRefRead.resetTimer();
                            otpRefRead.startOtpTimer();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: Text(
                              'Gửi lại',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.blue0093D5,
                                  ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.w),
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: ColorName.grey6F6E71,
                                  ),
                              children: [
                                const TextSpan(text: 'Gửi lại trong'),
                                TextSpan(
                                  text: ' ${otpRefWatch.second} ',
                                  style: const TextStyle(
                                    color: ColorName.blue0093D5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const TextSpan(text: 'giây'),
                              ],
                            ),
                          ),
                        ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  ProviderBase<OtpVerificationViewModel> get viewModelProvider =>
      otpVerificationViewModel;

  @override
  bool get checkIsLoading => true;

  @override
  void redirectAction(BuildContext context, Redirect redirect, data) {
    if (redirect == Redirect.openOtpVerificationPage) {}
  }
}

class OtpWidget extends ConsumerStatefulWidget {
  const OtpWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OtpWidgetState();
  }
}

class _OtpWidgetState extends ConsumerState<OtpWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        cursorColor: ColorName.blue0093D5,
        keyboardType: TextInputType.number,
        textStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.w500),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          fieldWidth: 32.w,
          selectedFillColor: Colors.white,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: ColorName.greyD9D9D9,
          activeColor: ColorName.blue0093D5,
          selectedColor: ColorName.blue0093D5,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: (v) {
          ref.watch(otpVerificationViewModel).changeContinueButtonStatus(true);
        },
        onChanged: (value) {
          ref
              .watch(otpVerificationViewModel)
              .changeContinueButtonStatus(value.trim().length == 6);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          return true;
        },
        appContext: context,
      ),
    );
  }
}
