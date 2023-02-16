import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/domain/annotation/redirect.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/user/login_usecase.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_phonenumber_usecase.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_view_model.dart';
import 'package:flutter_clean_architecture/src/presentation/model/pair.dart';

class LoginViewModel extends BaseViewModel {
  final ValidatePhoneNumberUseCase validatePhoneNumberUseCase;
  final LoginUseCase loginUseCase;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isContinue = false;

  LoginViewModel({
    required this.validatePhoneNumberUseCase,
    required this.loginUseCase,
  }) {
    init();
  }

  void init() {
    phoneNumberController.addListener(validatePhoneNumber);
    passwordController.addListener(validatePhoneNumber);
  }

  void validatePhoneNumber() async {
    String phoneNumber = phoneNumberController.text.trim();
    String passWord = passwordController.text.trim();
    final phoneCheck =
        await validatePhoneNumberUseCase.createObservable(phoneNumber);
    isContinue = phoneCheck && passWord.length >= 6;
    notifyListeners();
  }

  void onLogin() async {
    try {
      setLoading(true);
      notifyListeners();
      final params = LoginUseCaseParams(
        passWord: passwordController.text,
        phoneNumber: phoneNumberController.text,
      );
      await loginUseCase.createObservable(params);
      setRedirect(Pair<Redirect, dynamic>(Redirect.openHomeScreen, null));
    } on Exception catch (e) {
      setThrowable(e);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
