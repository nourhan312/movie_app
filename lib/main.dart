import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  DioHelper.init();

  int testMovieId = 533535; // Example movie ID for testing

  // Call the getSimilar method and print the results
  try {
    List<ResultModel> similarMovies =
        await GetSimilarMovie.getSimilar(id: testMovieId);
    print("Similar Movies for Movie ID $testMovieId:");
    for (var movie in similarMovies) {
      print("Title: ${movie.originalTitle}, Rating: ${movie.voteAverage}");
    }
  } catch (e) {
    print("Error occurred while fetching similar movies: $e");
  }
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
