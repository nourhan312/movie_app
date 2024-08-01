import 'package:flutter/material.dart';

import '../../../core/theming/text_style.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow.shade700, Colors.yellow.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back button press
              },
            ),
            const SizedBox(height: 40),
            const Text(
              'SIGN-UP',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
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
                    // Handle login now press
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
    );
  }
}

