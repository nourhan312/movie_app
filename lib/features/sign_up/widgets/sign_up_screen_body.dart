import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/widgets/primary_color_widget.dart';

import '../../../core/theming/text_style.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryColorWidget(
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                Text(
                  'SIGN-UP',
                  style: TextStyles.font48SemiBold,
                ),
                const SizedBox(height: 20),
                const CustomTexFormField(
                  isPassword: false,
                  hintText: "Enter your NAME",
                ),
                const SizedBox(height: 20),
                const CustomTexFormField(
                  hintText: 'Enter your E-mail',
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                const CustomTexFormField(
                  hintText: 'Enter Password',
                  isPassword: true,
                ),
                const SizedBox(height: 70),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign-up button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(330, 55),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    child:  Text('Sign-Up',style: TextStyles.font24Bold,),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an acc.?",style: TextStyles.font18SemiBold,),
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                      child: Text(
                        'LogIn Now',
                        style: TextStyles.font18SemiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}

