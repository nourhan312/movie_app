import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_screen.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
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
          home: OnboardingScreen(),
          title: 'Movie App',
          theme: ThemeData(
            brightness: Brightness.dark
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }

}
