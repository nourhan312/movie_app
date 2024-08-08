

import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';


class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;

  const OnboardingPage({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: 298, height: 300),
        const SizedBox(height: 200),
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
