import 'package:flutter_clean_architecture/src/data/remote/requests/login_request.dart';
import 'package:flutter_clean_architecture/src/data/remote/response/login_response.dart';

abstract class UserRepository {
  Future<void> saveAccessToken(String accessToken);

  Future<String?> getAccessToken();

  Future<LoginResponse> login(LoginRequest loginRequest);
}
