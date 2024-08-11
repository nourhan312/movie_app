

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';

import '../../../../core/theming/text_style.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../sign_up/ui/widgets/dont_have_acount.dart';
import '../../logic/login_cubit.dart';
import 'login_button.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: Colors.black38,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: context.read<LoginCubit>().form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 120),
                Text(
                  "LOG-IN",
                  style: TextStyles.font48SemiBold.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 50),
                CustomTexFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintStyle: TextStyles.font16Medium.copyWith(color: Colors.white.withOpacity(0.8)),
                  hintText: "Enter Your E-mail",
                  controller: context.read<LoginCubit>().emailController,
                  validator: (value) {
                    if (!value!.emailValid || value.isEmpty) {
                      return "please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTexFormField(
                  hintStyle: TextStyles.font16Medium.copyWith(color: Colors.white.withOpacity(0.8)),
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
                const SizedBox(height: 50),
                const LoginButton(),
                const SizedBox(height: 70),
                const DontHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}