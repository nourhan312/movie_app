import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) =>  OnboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>  OnboardingScreen(),
        );
    }
  }
}