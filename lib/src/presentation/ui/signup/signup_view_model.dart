import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_password_use_case.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_phonenumber_usecase.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  final ValidatePassWordUseCase validatePassWordUseCase;
  final ValidatePhoneNumberUseCase validatePhoneNumberUseCase;

  SignupViewModel({
    required this.validatePassWordUseCase,
    required this.validatePhoneNumberUseCase,
  }) {
    init();
  }

  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isEnoughCharacter = false;
  bool isContainerUpperAndLowerCase = false;
  bool isContainerNumber = false;
  bool isPhoneValid = false;

  void init() {
    passController.addListener(onValidatePassword);
    phoneNumberController.addListener(onValidatePhoneNumber);
  }

  void onValidatePassword() async {
    String password = passController.text.trim();
    final value = await validatePassWordUseCase.createObservable(password);
    isEnoughCharacter = value.isEnoughCharacter;
    isContainerUpperAndLowerCase = value.isContainerUpperAndLowerCase;
    isContainerNumber = value.isContainerNumber;
    notifyListeners();
  }

  void onValidatePhoneNumber() async {
    String phone = phoneNumberController.text.trim();
    final value = await validatePhoneNumberUseCase.createObservable(phone);
    isPhoneValid = value;
    notifyListeners();
  }

  bool get isContinue =>
      isEnoughCharacter &&
      isContainerUpperAndLowerCase &&
      isContainerNumber &&
      isPhoneValid;

  @override
  void dispose() {
    phoneNumberController.dispose();
    passController.dispose();
    super.dispose();
  }
}
