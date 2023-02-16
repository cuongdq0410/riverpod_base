import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/di/app_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/app_navigator.dart';
import 'package:flutter_clean_architecture/src/presentation/navigation/route_define.dart';
import 'package:flutter_clean_architecture/src/presentation/utils/keyboard_utils.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme/app_theme.dart';

class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Riverpod Base',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppNavigator.navigatorKey,
          theme: AppTheme.lightTheme,
          themeMode: ref.watch(appThemeProvider).currentTheme,
          darkTheme: AppTheme.darkTheme,
          localizationsDelegates: Resource.localizationsDelegates,
          supportedLocales: Resource.supportedLocales,
          initialRoute: RouteDefine.homePage.name,
          onGenerateRoute: GenerateRoute.generateRoute,
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            if (supportedLocales.any((element) =>
                locale?.languageCode.contains(element.toString()) == true)) {
              // ref.watch(localeCodeProvider.notifier).state = locale!.languageCode;
              return locale;
            }
            return const Locale('en', '');
          },
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                KeyboardUtils.hideKeyboard(context);
              },
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child ?? const SizedBox(),
              ),
            );
          },
        );
      },
    );
  }
}
