import 'package:flutter_clean_architecture/src/data/remote/requests/login_request.dart';
import 'package:flutter_clean_architecture/src/data/remote/response/login_response.dart';
import 'package:flutter_clean_architecture/src/domain/repository/user_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class LoginUseCaseParams {
  String phoneNumber;
  String passWord;

  LoginUseCaseParams({
    required this.phoneNumber,
    required this.passWord,
  });
}

class LoginUseCase extends UseCase<LoginUseCaseParams, LoginResponse> {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  @override
  Future<LoginResponse> createObservable(LoginUseCaseParams params) async {
    LoginResponse loginResponse = await _userRepository.login(
      LoginRequest(phoneNumber: params.phoneNumber, password: params.passWord),
    );
    final accessToken = loginResponse.token ?? '';
    if (accessToken != '') {
      _userRepository.saveAccessToken(accessToken);
    }
    return loginResponse;
  }
}
