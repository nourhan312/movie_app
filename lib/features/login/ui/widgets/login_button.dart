

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/helper/extentions.dart';

import '../../../../core/helper/hive_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../logic/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (context.read<LoginCubit>().form.currentState!.validate()) {
          context.read<LoginCubit>().login(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text);
        }
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context,state) {
              if (state is LoginSuccess) {
                HiveHelpers.myBox!.put("notShowAuthScreen", "true");
                context.pushReplacementNamed(Routes.homeScreen);
              }
              if (state is LoginError) {
                Get.snackbar("Error", state.msg,colorText: Colors.white,backgroundColor: Colors.red);
              }
            },
            builder: (context, state) {
              if(state is LoginLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Text("Log-In",
                textAlign: TextAlign.center,
                style: TextStyles.font27semiBold.copyWith(
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
