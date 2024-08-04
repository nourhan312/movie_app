import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/helper/hive_helper.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'core/networking/dio_helper.dart';
import 'package:movie_app/features/details/ui/detail_screen.dart';
import 'package:movie_app/core/networking/services/get_movie_details.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'package:movie_app/features/home/data/models/credits_model.dart';
import 'package:movie_app/features/home/data/models/details_model.dart';
import 'package:movie_app/features/home_screen/ui/home_screen.dart';
import 'package:movie_app/features/search/ui/search.dart';
import 'core/networking/dio_helper.dart';
import 'core/networking/services/get_credits.dart';
import 'core/networking/services/get_similar_movie.dart';
import 'core/networking/services/get_top_rated.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/home_screen/data/models/movie_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the desired color here
    statusBarIconBrightness: Brightness.dark, // For light icons
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>(HiveHelpers.movieBox);
  DioHelper.init();

  List<Movie> result =
      await SearchMovie.searchMoviesByQuery(query: 'Inception');
  for (var i in result) {
    if (kDebugMode) {
      print(i.originalTitle);
    }
  Credits result = await GetCredits.getCredits(
    seriesId: 1399,
    seasonNumber: 1,
    episodeNumber: 1,
  );
  List<Cast> cast = result.cast;
  for (var element in cast) {
    print(element.name);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Set your desired color here
    ),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'Movie App',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.homeScreen,
            onGenerateRoute: appRouter.generateRoute,
          )),
    );
  }
}
