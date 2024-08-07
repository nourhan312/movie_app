import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/login/ui/widgets/login_button.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Form(
              key: context.read<LoginCubit>().form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Text("LOG-IN", style: TextStyles.font48SemiBold),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTexFormField(
                      hintStyle: TextStyles.font16Medium,
                      hintText: "Enter Your E-mail",
                      controller: context.read<LoginCubit>().emailController,
                      validator: (value) {
                        if (!value!.emailValid||value.isEmpty) {
                          return "please enter a valid email";
                        }
                        return null;
                      }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTexFormField(
                    hintStyle: TextStyles.font16Medium,
                    hintText: "Enter Password",
                    controller: context.read<LoginCubit>().passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const LoginButton(),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have Account?",
                        style: TextStyles.font18SemiBoldWhite,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushReplacementNamed(Routes.signUpScreen);
                        },
                        child: Text(
                          "Sign-Up Now",
                          style: TextStyles.font18SemiBoldWhite,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

