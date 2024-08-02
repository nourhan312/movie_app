import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';
import '../../features/login/ui/login_screen.dart';



class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SignUpScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) =>  const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>  const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
    }
  }
}