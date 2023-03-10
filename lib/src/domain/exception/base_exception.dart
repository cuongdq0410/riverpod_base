import 'package:flutter_clean_architecture/src/domain/annotation/exception_type.dart';

abstract class BaseException implements Exception {
  final int code;
  final String message;
  final ExceptionType exceptionType;

  const BaseException(this.code, this.message, this.exceptionType);
}