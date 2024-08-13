import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/theming/app_colors.dart';

class NoResultsPage extends StatelessWidget {
  const NoResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      body:  Center(
        child: Lottie.asset(
          'assets/images/Animation - 1723576954655.json', // The path to your Lottie file
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          repeat: true,
          reverse: false,
          animate: true,
        ),
      ),
    );
  }
}
