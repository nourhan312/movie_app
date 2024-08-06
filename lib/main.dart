import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/helper/hive_helper.dart';
import 'package:movie_app/core/helper/login_hive_helper.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'core/helper/bloc_observer.dart';
import 'core/networking/dio_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/home_screen/data/models/movie_model.dart';
import 'features/home_screen/logic/categories_cubit/categories_cubit.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(TokenHelper.TOKEN);
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>(HiveHelpers.movieBox);
  DioHelper.init();

  await SearchMovie.searchMoviesByQuery(query: 'Inception');
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}


class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For light icons
        ),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Movie App',
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.detailsScreen,
              onGenerateRoute: appRouter.generateRoute,
            )),
      ),
    );
  }
}
