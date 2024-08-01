

import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';


class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;

  const OnboardingPage({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Image.asset(image, width: 298, height: 464),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.textOnBoarding,
          ),
        ),
      ],
    );
  }
}
