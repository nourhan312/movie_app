import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/details/ui/movie_details.dart';
import 'package:movie_app/features/home_screen/logic/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home_screen/logic/trending_movie_cubit/trending_cubit.dart';
import 'package:movie_app/features/home_screen/ui/home_screen.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';
import '../../features/details/data/models/movie_arg.dart';
import '../../features/details/logic/details_cubit.dart';
import '../../features/genres/logic/genres_cubit.dart';
import '../../features/genres/ui/categories_screen.dart';
import '../../features/genres/ui/movies_dependes_on_genre.dart';
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
      case Routes.movieGenres:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<GenresCubit>(
              create: (context) => GenresCubit()..getGenres(),
              child: const CategoriesScreen()),
        );
      case Routes.movieCategory:
        if (arguments is int) {
          int id = arguments;
          return MaterialPageRoute(
            builder: (_) => BlocProvider<GenresCubit>(
                create: (context) =>
                    GenresCubit()..getMoviesDependsOnGenreId(id: id),
                child: const MoviesDependsOnGenre()),
          );
        }
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(), child: const LoginScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => TrendingCubit()..getTrendingMovies()),
            BlocProvider(
                create: (context) => CategoriesCubit()
                  ..getNowPlayingMovies()
                  ..getPopularMovies()
                  ..getTopRatedMovies()
                  ..getUpcomingMovies()),
            BlocProvider<GenresCubit>(
              create: (context) => GenresCubit()..getGenres(),
            ),
          ], child: const HomeScreen()),
        );
      case Routes.movieDetails:
        if (arguments is MovieArg) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => DetailsCubit()
                  ..movieDetails(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id)
                  ..getReviews(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id)
                  ..getMovieCredits(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id)
                  ..getVideo(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id)
                  ..getSimilar(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id)
                  ..getRecommendations(
                      id: arguments.movie == null
                          ? arguments.movieGenres!.id
                          : arguments.movie!.id),
                child: MovieDetails(
                  movies: arguments,
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
