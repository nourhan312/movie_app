import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/movie_details.dart';
import 'core/helper/hive_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/fav/logic/fav_cubit.dart';
import 'features/home_screen/logic/categories_cubit/categories_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit()..loadFavorites(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For light icons
        ),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Movie App',
              debugShowCheckedModeBanner: false,
              // initialRoute:
              //     HiveHelpers.myBox!.get("notShowAuthScreen") == "true"
              //         ? Routes.homeScreen
              //         : Routes.onBoardingScreen,
              onGenerateRoute: appRouter.generateRoute,
            )),
      ),
    );
  }
}
