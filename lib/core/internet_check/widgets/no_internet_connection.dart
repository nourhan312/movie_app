
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class NoInternetWidget extends StatelessWidget {

  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff242A32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/Animation - 1723588285430.json', // The path to your Lottie file
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              repeat: true,
              reverse: false,
              animate: true,
            ),
          ),
          SizedBox(height: 50),
          Text(
            "Please check your internet settings\nand try again.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}