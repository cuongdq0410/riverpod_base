import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/data/remote/requests/login_request.dart';
import 'package:flutter_clean_architecture/src/data/remote/response/login_response.dart';
import 'package:retrofit/http.dart';

part 'laundry_api.g.dart';

@RestApi()
abstract class LaundryApi {
  factory LaundryApi(Dio dioBuilder) = _LaundryApi;

  @POST('/laundry/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
