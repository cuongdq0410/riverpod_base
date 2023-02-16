import 'package:flutter_clean_architecture/src/data/di/repository_provider.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/otp_verification/verify_otp_use_case.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/user/login_email_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/user/login_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_password_use_case.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_phonenumber_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_user_name_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final validateEmailUseCase = Provider<ValidateEmailUseCase>(
  (ref) => ValidateEmailUseCase(),
);

final validatePassWordUseCase = Provider<ValidatePassWordUseCase>(
  (ref) => ValidatePassWordUseCase(),
);

final senOtpToEmailUseCase = Provider<SendOtpToEmailUseCase>(
  (ref) => SendOtpToEmailUseCase(ref.watch(otpRepositoryProvider)),
);

final verifyOtpUseCase = Provider<VerifyOtpUseCase>(
  (ref) => VerifyOtpUseCase(ref.watch(otpRepositoryProvider)),
);

final validatePhoneNumberUseCase = Provider<ValidatePhoneNumberUseCase>(
  (ref) => ValidatePhoneNumberUseCase(),
);

final loginUseCase = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(userRepository)),
);
