import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/home/home_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/intro/intro_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/login/login_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/otp_verifcation/otp_verification_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/rule_and_policy/policy_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/rule_and_policy/rule_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/signup/signup_page.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/splash/splash_page.dart';

import 'transitions/fade_page_route.dart';
import 'transitions/no_animation_page_route.dart';

enum RouteDefine {
  loginPage,
  homePage,
  splashPage,
  introPage,
  signupPage,
  otpVerificationPage,
  rulePage,
  policyPage,
}

class GenerateRoute {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.loginPage.name: (_) => const LoginPage(),
      RouteDefine.homePage.name: (_) => const HomePage(),
      RouteDefine.splashPage.name: (_) => const SplashPage(),
      RouteDefine.introPage.name: (_) => const IntroPage(),
      RouteDefine.signupPage.name: (_) => const SignupPage(),
      RouteDefine.otpVerificationPage.name: (_) => const OtpVerificationPage(),
      RouteDefine.rulePage.name: (_) => const RulePage(),
      RouteDefine.policyPage.name: (_) => const PolicyPage(),
    };

    final routeBuilder = routes[settings.name];
    if (settings.name == RouteDefine.splashPage.name) {
      return NoAnimationPageRoute(
        builder: (context) => routeBuilder!(context),
        settings: RouteSettings(name: settings.name),
      );
    }
    return FadePageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}
