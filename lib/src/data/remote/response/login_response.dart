import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clean_architecture/src/data/base/data_model.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LoginResponse with DataModel {
  final int? status;
  final String? token;
  final String? message;

  LoginResponse({
    this.status,
    this.token,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
