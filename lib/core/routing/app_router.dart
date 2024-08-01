import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';

import '../../features/on_boarding/ui/on_boarding_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
    }
  }
}