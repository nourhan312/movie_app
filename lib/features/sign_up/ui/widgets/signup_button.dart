import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/features/sign_up/data/models/user_model.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_cubit.dart';

import '../../../../core/helper/hive_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../../../core/widgets/flutter_toast.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
            User user = User(
              name: context.read<SignUpCubit>().nameController.text,
              phone: context.read<SignUpCubit>().phoneNumberController.text,
              email: context.read<SignUpCubit>().emailController.text,
              password: context.read<SignUpCubit>().passwordController.text,
            );
            await context.read<SignUpCubit>().signUp(user: user);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          minimumSize: const Size(330, 55),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(fontSize: 25),
        ),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context,state) {
            if (state is SignUpSuccess) {
              HiveHelpers.myBox!.put("notShowAuthScreen", "true");
              showFlutterToastSuccess(state.message);
              context.pushReplacementNamed(Routes.homeScreen);
            }
            if(state is SignUpError)
              {
                showFlutterToastError(state.errorMessage);
              }
          },
          builder: (context, state) {
            if(state is SignUpLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text(
                "Sign-Up",
                textAlign: TextAlign.center,
                style: TextStyles.font23semiBold.copyWith(
                color: Colors.black,
            ),
            );
          },
        ),
      ),
    );
  }
}
