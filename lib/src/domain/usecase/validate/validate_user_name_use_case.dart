import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class ValidateEmailUseCase extends UseCase<String, String> {
  @override
  Future<String> createObservable(String params) {
    if (params.isEmpty) return Future.value('1');
    return Future.value('0');
  }
}
