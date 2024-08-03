import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class SignUpTextFormFieldSection extends StatefulWidget {
  const SignUpTextFormFieldSection({super.key});

  @override
  State<SignUpTextFormFieldSection> createState() => _SignUpTextFormFieldSectionState();
}

class _SignUpTextFormFieldSectionState extends State<SignUpTextFormFieldSection> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTexFormField(
          hintText: "Enter your NAME",
          controller: nameController,
        ),
        const SizedBox(height: 20),
        CustomTexFormField(
          hintText: "Enter your Phone Number",
          controller: phoneNumberController,
        ),
        const SizedBox(height: 20),
        CustomTexFormField(
          hintText: 'Enter your E-mail',
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTexFormField(
          hintText: 'Enter Password',
          isPassword: true,
          controller: passwordController,
        ),
        const SizedBox(height: 70),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
