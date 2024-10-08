import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/helper/hive_helper.dart';
import 'core/helper/bloc_observer.dart';
import 'core/networking/auth_api.dart';
import 'core/networking/dio_helper.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = AppBlocObserver();
  await HiveHelpers.initHive();
  DioHelper.init();
  AuthApi.init();
  showAuthScreen();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

void showAuthScreen() {
  if (HiveHelpers.myBox!.get("notShowAuthScreen") == "true") {
    HiveHelpers.myBox!.put("notShowAuthScreen", "true");
  } else {
    HiveHelpers.myBox!.put("notShowAuthScreen", "false");
  }
}
