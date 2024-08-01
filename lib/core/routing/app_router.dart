import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';

import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';



class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) =>  signUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => signUpScreen(),
        );
    }
  }
}