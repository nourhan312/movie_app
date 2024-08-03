import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/primary_color_widget.dart';

import '../../../core/theming/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryColorWidget(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
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
                  hintText: "Enter Your E-mail",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTexFormField(
                  hintText: "Enter Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Log-In",
                          textAlign: TextAlign.center,
                          style: TextStyles.font27semiBold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Text(
                      "New to our app?",
                      style: TextStyles.font20Regular,
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
                        style: TextStyles.font20Medium,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
