import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/sign_up/data/models/sign_up_response.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:movie_app/features/sign_up/ui/widgets/sign_up_screen_body.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.bodyApp,
        body: BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpScreenBody(),
        ));
  }
}


