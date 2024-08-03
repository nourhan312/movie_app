



import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
