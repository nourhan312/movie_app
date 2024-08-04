import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/ui/detail_screen.dart';
import 'package:movie_app/features/search/ui/search.dart';

import 'core/networking/dio_helper.dart';
import 'core/networking/services/get_top_rated.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the desired color here
    statusBarIconBrightness: Brightness.dark, // For light icons
  ));
  DioHelper.init();

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
          home: DetailScreen(),
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          //initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
