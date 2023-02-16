import 'package:flutter_clean_architecture/src/presentation/base/base_view_model.dart';

class IntroViewModel extends BaseViewModel {
  int _slideIndex = 0;

  int get slideIndex => _slideIndex;

  void setSlideIndex(int index) {
    _slideIndex = index;
    notifyListeners();
  }
}
