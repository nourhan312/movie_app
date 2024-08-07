import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/app_colors.dart';

class NoResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no-results.png",width: 50,height: 50,),
            const SizedBox(height: 20),
            const Text(
              'We Are Sorry, We Can Not Find The Movie :(',
                style: TextStyle(
                color: Colors.white
            ),
              textAlign: TextAlign.center,

            ),
          ],
        ),
      ),
    );
  }
}
