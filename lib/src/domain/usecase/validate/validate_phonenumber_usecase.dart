import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class ValidatePhoneNumberUseCase extends UseCase<String, bool> {
  @override
  Future<bool> createObservable(String params) {
    RegExp regexPhoneNumber = RegExp(r'^(84|0[3|5|7|8|9])+([0-9]{8})\b');
    return Future.value(regexPhoneNumber.hasMatch(params));
  }
}
