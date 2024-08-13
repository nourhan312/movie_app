
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/widgets/flutter_toast.dart';

import '../../../../core/helper/hive_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../logic/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (context.read<LoginCubit>().form.currentState!.validate()) {
          context.read<LoginCubit>().login(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                HiveHelpers.myBox!.put("notShowAuthScreen", "true");
                showFlutterToastSuccess(state.msg);
                context.pushReplacementNamed(Routes.homeScreen);
              }
              if (state is LoginError) {
                showFlutterToastError(state.msg);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return  Center(
                  child: CupertinoActivityIndicator(color: Colors.black,radius: 15.0,),
                );
              }
              return Text(
                "Log-In",
                textAlign: TextAlign.center,
                style: TextStyles.font23semiBold.copyWith(
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
