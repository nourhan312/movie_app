import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'features/home/data/models/movie_model.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the desired color here
    statusBarIconBrightness: Brightness.dark, // For light icons
  ));
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
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
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          home: HomeScreen(),
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          //initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
