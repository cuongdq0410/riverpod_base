import 'package:flutter_clean_architecture/src/presentation/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeCodeProvider = StateProvider<String>((ref) => 'en');

final appThemeProvider = ChangeNotifierProvider(
  (ref) => AppTheme(),
);
