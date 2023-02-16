import 'package:flutter_clean_architecture/src/domain/repository/otp_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class SendOtpParams {
  String email;

  SendOtpParams(this.email);
}

class SendOtpToEmailUseCase extends UseCase<SendOtpParams, bool> {
  final OtpRepository _otpRepository;

  SendOtpToEmailUseCase(this._otpRepository);

  @override
  Future<bool> createObservable(SendOtpParams params) async {
    return _otpRepository.sendOtpCode(params.email);
  }
}
