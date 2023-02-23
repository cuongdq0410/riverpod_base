import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/domain/annotation/redirect.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_stateless_view.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/route_define.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/authorize_common_top.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/custom_back_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/password_check_text.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/textfields/common_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'signup_view_model.dart';

class SignupPage extends BaseStatelessView<SignupViewModel> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget createView(BuildContext context) {
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
                  Consumer(builder: (context, ref, _) {
                    return CommonButton(
                      isDisable: !ref.watch(viewModelProvider).isContinue,
                      onPressed: () {
                        pushScreen(RouteDefine.otpVerificationPage.name);
                      },
                      buttonText: 'Tiếp tục',
                    );
                  })
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
      child: Consumer(builder: (context, ref, _) {
        final signupRef = ref.watch(viewModelProvider);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              const AuthorizeCommonTop(title: 'Đăng kí'),
              CommonTextField(
                label: 'Số điện thoại',
                margin: EdgeInsets.only(top: 27.h, bottom: 16.h),
                controller: signupRef.phoneNumberController,
              ),
              CommonTextField(
                label: 'Mật khẩu',
                isObscure: true,
                controller: signupRef.passController,
              ),
              Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 16.w),
                  child: Text(
                    'Mật khẩu hoặc số điện thoại không đúng',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorName.redBF4A4A,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 21.h),
              Consumer(
                builder: (context, ref, _) {
                  return PasswordCheckText(
                    isCheck: signupRef.isEnoughCharacter,
                    title: 'Tối thiểu 8 kí tự',
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  return PasswordCheckText(
                    isCheck: signupRef.isContainerUpperAndLowerCase,
                    title: 'Có một chữ hoa và một chữ thường',
                    margin: EdgeInsets.symmetric(vertical: 7.h),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  return PasswordCheckText(
                    isCheck: signupRef.isContainerNumber,
                    title: 'Có một số',
                  );
                },
              ),
              SizedBox(height: 24.h),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorName.grey6F6E71,
                        height: 1.3,
                      ),
                  children: [
                    const TextSpan(text: 'Bằng việc tiếp tục bạn đồng ý với '),
                    TextSpan(
                      text: 'Điều khoản sử dụng ',
                      style: const TextStyle(
                          color: ColorName.blue0093D5,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushScreen(RouteDefine.rulePage.name);
                        },
                    ),
                    const TextSpan(text: 'và '),
                    TextSpan(
                      text: 'Chính sách quyền riêng tư ',
                      style: const TextStyle(
                          color: ColorName.blue0093D5,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushScreen(RouteDefine.policyPage.name);
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  ProviderBase<SignupViewModel> get viewModelProvider => signupViewModel;

  @override
  bool get checkIsLoading => true;

  @override
  void redirectAction(BuildContext context, Redirect redirect, data) {
    if (redirect == Redirect.openOtpVerificationPage) {}
  }
}
