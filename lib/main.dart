import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/networking/services/get_movie_details.dart';
import 'package:movie_app/features/home/data/models/details_model.dart';
import 'package:movie_app/features/search/ui/search.dart';

import 'core/networking/dio_helper.dart';
import 'core/networking/services/get_similar_movie.dart';
import 'core/networking/services/get_top_rated.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/home/data/models/movie_model.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the desired color here
    statusBarIconBrightness: Brightness.dark, // For light icons
  ));
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  int testMovieId = 533535;
  MovieDetails movieDetails = await GetMovieDetails.getDetails(id: testMovieId);

  print('Movie Title: ${movieDetails.title}');
  print('Movie Overview: ${movieDetails.overview}');
  print('Movie Poster Path: ${movieDetails.posterPath}');

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          home: Search(),
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          //initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
