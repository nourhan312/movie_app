import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/details/movie_details.dart';
import 'package:movie_app/features/details/ui/detail_screen.dart';
import 'package:movie_app/features/home_screen/ui/home_screen.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:movie_app/features/search/ui/home_screen_search.dart';
import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';
import '../../features/details/logic/details_cubit.dart';
import '../../features/fav/ui/fav_screen.dart';
import '../../features/home_screen/data/models/movie_model.dart';
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
          builder: (_) => BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(), child: const LoginScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.favScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreenSearch(),
        );
      case Routes.movieDetails:
        if (arguments is Movie) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => DetailsCubit()
                  ..movieDetails(id: arguments.id)
                  ..getReviews(id: arguments.id)
                  ..getMovieCredits(id: arguments.id)
                  ..getVideo(id: arguments.id),
                child: MovieDetails(
                  movie: arguments,
                )),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
    }
    return null;
  }
}
