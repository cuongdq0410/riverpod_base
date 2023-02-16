import 'dart:async';

import 'package:flutter_clean_architecture/src/presentation/base/base_view_model.dart';

class OtpVerificationViewModel extends BaseViewModel {
  OtpVerificationViewModel() {
    startOtpTimer();
  }

  Timer? _timer;
  int second = 120;
  bool _isContinue = false;

  bool get isContinue => _isContinue;

  void changeContinueButtonStatus(bool value) {
    if (_isContinue != value) {
      _isContinue = value;
      notifyListeners();
    }
  }

  void startOtpTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (second == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          second--;
          notifyListeners();
        }
      },
    );
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    second = 121;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
