import 'package:flutter/material.dart';
import 'package:sma/features/splash/splash.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashPage(),
        );
      default:
        return null;
    }
  }
}
