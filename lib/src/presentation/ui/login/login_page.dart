import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/domain/annotation/redirect.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_stateless_view.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/login/login_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/authorize_common_top.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/custom_back_button.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/textfields/common_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends BaseStatelessView<LoginViewModel> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget createView(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              buildMain(context, ref),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onPress: popScreen),
                  Consumer(
                    builder: (context, ref, _) {
                      return CommonButton(
                        isDisable: !ref.watch(viewModelProvider).isContinue,
                        onPressed: () {
                          ref.read(viewModelProvider).onLogin();
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

  Expanded buildMain(BuildContext context, WidgetRef ref) {
    final loginRef = ref.watch(viewModelProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const AuthorizeCommonTop(title: 'Đăng nhập'),
            CommonTextField(
              label: 'Số điện thoại',
              margin: EdgeInsets.only(top: 27.h, bottom: 16.h),
              controller: loginRef.phoneNumberController,
            ),
            CommonTextField(
              label: 'Mật khẩu',
              isObscure: true,
              controller: loginRef.passwordController,
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
            )
          ],
        ),
      ),
    );
  }

  @override
  ProviderBase<LoginViewModel> get viewModelProvider => loginViewModelProvider;

  @override
  bool get checkIsLoading => true;

  @override
  void redirectAction(BuildContext context, Redirect redirect, data) {
    if (redirect == Redirect.openOtpVerificationPage) {}
  }
}
