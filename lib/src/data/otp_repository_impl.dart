import 'package:flutter_clean_architecture/src/data/mapper/exception_mapper.dart';
import 'package:flutter_clean_architecture/src/data/remote/api/laundry_api.dart';
import 'package:flutter_clean_architecture/src/domain/repository/otp_repository.dart';

class OtpRepositoryImpl implements OtpRepository {
  final LaundryApi _laundryApi;
  final ExceptionMapper _exceptionMapper;

  OtpRepositoryImpl(this._laundryApi, this._exceptionMapper);

  @override
  Future<bool> sendOtpCode(String email) {
    // // TODO: implement sendOtpCode
    return Future.delayed(Duration(seconds: 2), () => true);
  }

  @override
  Future<bool> verifyOtp(String otp) {
    // // TODO: implement verifyOtp
    return Future.delayed(Duration(seconds: 2), () => true);
  }
}
