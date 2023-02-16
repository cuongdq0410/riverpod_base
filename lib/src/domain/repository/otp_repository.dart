abstract class OtpRepository {
  Future<bool> sendOtpCode(String email);
  
  Future<bool> verifyOtp(String otp);
}
