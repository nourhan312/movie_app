import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';

import '../../../../core/theming/text_style.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/sign_up_cubit.dart';

class SignUpTextFormFieldSection extends StatelessWidget {
  const SignUpTextFormFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTexFormField(
            hintText: "Enter your NAME",
            hintStyle: TextStyles.font16Medium,
            controller: context.read<SignUpCubit>().nameController,
              validator: (value) {
                if ( value == null || value.isEmpty ) {
                  return "please Enter your Name";
                }
                return null;
              }
          ),
          const SizedBox(height: 20),
          CustomTexFormField(
            keyboardType: TextInputType.phone,
            hintStyle: TextStyles.font16Medium,
            hintText: "Enter your Phone Number",
            controller: context.read<SignUpCubit>().phoneNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter your Phone Number";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTexFormField(
            keyboardType: TextInputType.emailAddress,
            hintStyle: TextStyles.font16Medium,
            hintText: 'Enter your E-mail',
            controller: context.read<SignUpCubit>().emailController,
            validator: (value) {
              if (value == null|| !value.emailValid  || value.isEmpty) {
                return "please enter a valid Email";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTexFormField(
            keyboardType: TextInputType.visiblePassword,
            hintStyle: TextStyles.font16Medium,
            hintText: 'Enter Password',
            isPassword: true,
            controller: context.read<SignUpCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter a valid password";
              }
              return null;
            },
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
