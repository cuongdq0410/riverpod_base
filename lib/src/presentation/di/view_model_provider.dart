import 'package:flutter_clean_architecture/src/presentation/base/loading_state_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/home/home_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/intro/intro_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/login/login_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/otp_verifcation/otp_verification_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/signup/signup_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/splash/splash_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'use_case_provider.dart';

final loadingStateProvider = ChangeNotifierProvider(
  (ref) => LoadingStateViewModel(),
);

final splashViewModelProvider = ChangeNotifierProvider<SplashViewModel>(
  (ref) => SplashViewModel(),
);

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>(
  (ref) => LoginViewModel(
    validatePhoneNumberUseCase: ref.watch(validatePhoneNumberUseCase),
    loginUseCase: ref.watch(loginUseCase),
  ),
);

final homeViewModel = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(),
);

final introViewModel = ChangeNotifierProvider<IntroViewModel>(
  (ref) => IntroViewModel(),
);

final signupViewModel = ChangeNotifierProvider.autoDispose<SignupViewModel>(
  (ref) => SignupViewModel(
    validatePassWordUseCase: ref.watch(validatePassWordUseCase),
    validatePhoneNumberUseCase: ref.watch(validatePhoneNumberUseCase),
  ),
);

final otpVerificationViewModel =
    ChangeNotifierProvider.autoDispose<OtpVerificationViewModel>(
  (ref) => OtpVerificationViewModel(),
);
