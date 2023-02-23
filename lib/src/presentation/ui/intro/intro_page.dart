import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_stateless_view.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/model/slide_image_view_data_model.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/route_define.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/buttons/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'intro_view_model.dart';

class IntroPage extends BaseStatelessView<IntroViewModel> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget createView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h, width: double.infinity),
              Assets.images.icSmallLogoFull.svg(),
              SizedBox(height: 46.h),
              Expanded(
                child: Consumer(builder: (context, ref, _) {
                  return Swiper(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Spacer(),
                          slideImages[index].image,
                          SizedBox(height: 24.h),
                          Text(
                            slideImages[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(height: 1.3),
                          ),
                        ],
                      );
                    },
                    autoplay: true,
                    duration: 4000,
                    itemCount: slideImages.length,
                    curve: Curves.fastLinearToSlowEaseIn,
                    onIndexChanged: (index) {
                      ref.watch(viewModelProvider).setSlideIndex(index);
                    },
                  );
                }),
              ),
              SizedBox(height: 16.h),
              Consumer(
                builder: (context, ref, _) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      slideImages.length,
                      (index) => Container(
                        width: 8.w,
                        height: 8.w,
                        margin: EdgeInsets.only(
                          right: index == slideImages.length - 1 ? 0 : 24.w,
                        ),
                        decoration: BoxDecoration(
                          color:
                              ref.watch(viewModelProvider).slideIndex == index
                                  ? ColorName.blue0093D5
                                  : ColorName.greyD9D9D9,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 62.h),
              CommonButton(
                width: double.infinity,
                buttonText: 'Đăng kí',
                onPressed: () {
                  pushScreen(RouteDefine.signupPage.name);
                },
              ),
              CommonButton(
                width: double.infinity,
                buttonText: 'Đăng nhập',
                onPressed: () {
                  pushScreen(RouteDefine.loginPage.name);
                },
                backgroundColor: ColorName.greyD9D9D9,
                textColor: ColorName.grey6F6E71,
                margin: EdgeInsets.only(top: 16.h, bottom: 24.h),
              ),
              SafeArea(
                top: false,
                child: Assets.images.icLogo.svg(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProviderBase<IntroViewModel> get viewModelProvider => introViewModel;
}
