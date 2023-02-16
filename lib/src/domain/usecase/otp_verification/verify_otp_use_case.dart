import 'package:flutter_clean_architecture/src/domain/repository/otp_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class VerifyOtpParams {
  final String otp;

  VerifyOtpParams(this.otp);
}

class VerifyOtpUseCase extends UseCase<VerifyOtpParams, bool> {
  final OtpRepository _otpRepository;

  VerifyOtpUseCase(this._otpRepository);

  @override
  Future<bool> createObservable(VerifyOtpParams params) {
    return _otpRepository.verifyOtp(params.otp);
  }
}
