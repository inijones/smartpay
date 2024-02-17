import 'package:flutter/material.dart';
import 'package:smartpay/features/onboarding/view/splash_screen.dart';
import 'package:smartpay/rootpage.dart';

const String homeRoute = '/home';

///? should we use screen paths or just create the strings where
///? it's needed.
class ScreenPaths {
  static const String rootScreen = '/rootpage';
  static const String signInScreen = '/sign_in_screen';
  static const String homeScreen = '/home';
  static const String splashScreen = '/splashscreen';
}

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    //if user is logged in return dashboard with user, else return loginpage

    '/': (context) => const RootPage(),

    SplashScreen.route: (context) => const SplashScreen(),

    // HomePage.route: (context) => const HomePage(),
  };
}

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RootPage.route:
    default:
  }
  return null;
}
