
import 'package:flutter/material.dart';

import '../../theming/text_style.dart';

class NoInternetWidget extends StatelessWidget {

  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff242A32),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            "No Internet Connection",
            style: TextStyles.font24SemiBoldWhite,
          ),
          SizedBox(height: 10),
          Text(
            "Please check your internet settings and try again.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}