import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';

import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/on_boarding/ui/on_boarding_screen.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) =>  signUpScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => signUpScreen(),
        );
    }
  }
}