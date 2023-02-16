import 'package:flutter_clean_architecture/src/data/local/pref/app_pref.dart';
import 'package:flutter_clean_architecture/src/data/local/pref/pref_helper.dart';
import 'package:hive/hive.dart';

const prefsBox = 'prefs';

class AppStorage {
  AppStorage._();

  static AppStorage init() {
    return AppStorage._();
  }

  PrefHelper get prefHelper => AppPrefs(prefBox: Hive.box(prefsBox));
}
