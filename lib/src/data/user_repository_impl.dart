import 'package:flutter_clean_architecture/src/data/app_error.dart';
import 'package:flutter_clean_architecture/src/data/local/app_storage.dart';
import 'package:flutter_clean_architecture/src/data/mapper/exception_mapper.dart';
import 'package:flutter_clean_architecture/src/data/remote/api/laundry_api.dart';
import 'package:flutter_clean_architecture/src/data/remote/response/login_response.dart';
import 'package:flutter_clean_architecture/src/domain/repository/user_repository.dart';

import 'remote/requests/login_request.dart';

class UserRepositoryImpl implements UserRepository {
  final AppStorage _appStorage;
  final ExceptionMapper _exceptionMapper;
  final LaundryApi _laundryApi;

  UserRepositoryImpl(
    this._laundryApi,
    this._appStorage,
    this._exceptionMapper,
  );

  @override
  Future<void> saveAccessToken(String accessToken) {
    return _appStorage.prefHelper.setAccessToken(accessToken);
  }

  @override
  Future<String?> getAccessToken() {
    return _appStorage.prefHelper.getAccessToken();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _laundryApi
        .login(loginRequest)
        .catchError((error, stackTrace) async {
      throw await _exceptionMapper.mapperTo(AppError.from(error));
    });
  }
}
