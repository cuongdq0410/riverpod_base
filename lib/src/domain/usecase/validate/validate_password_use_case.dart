import 'package:flutter_clean_architecture/src/domain/usecase/usecase.dart';

class ValidatePassWordUseCase extends UseCase<String, PasswordChecking> {
  @override
  Future<PasswordChecking> createObservable(String params) {
    RegExp regexLeast1UpperCase = RegExp(r'^(?=.*[A-Z])');
    RegExp regexLeast1LowerCase = RegExp(r'^(?=.*[a-z])');
    RegExp regexLeast1Digital = RegExp(r'^(?=.*?[0-9])');
    bool isEnoughCharacter = params.length >= 8;
    bool isLeast1UpperCase = regexLeast1UpperCase.hasMatch(params);
    bool isLeast1LowerCase = regexLeast1LowerCase.hasMatch(params);
    bool isContainerUpperAndLowerCase = isLeast1UpperCase && isLeast1LowerCase;
    bool isContainerNumber = regexLeast1Digital.hasMatch(params);
    return Future.value(
      PasswordChecking(
        isContainerNumber: isContainerNumber,
        isContainerUpperAndLowerCase: isContainerUpperAndLowerCase,
        isEnoughCharacter: isEnoughCharacter,
      ),
    );
  }
}

class PasswordChecking {
  final bool isEnoughCharacter;
  final bool isContainerUpperAndLowerCase;
  final bool isContainerNumber;

  PasswordChecking({
    required this.isEnoughCharacter,
    required this.isContainerUpperAndLowerCase,
    required this.isContainerNumber,
  });
}
