import 'package:flutter/material.dart';
import 'package:sma/features/home/view/home_page.dart';
import 'package:sma/features/splash/splash.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashPage(),
        );
        case '/home':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
        );
      default:
        return null;
    }
  }
}
