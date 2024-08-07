import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/details/ui/detail_screen.dart';
import 'package:movie_app/features/home_screen/ui/home_screen.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:movie_app/features/search/ui/home_screen_search.dart';

import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';
import '../../features/login/ui/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreenSearch(),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
    }
  }
}
