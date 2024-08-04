import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff242A32),
      body: SafeArea(
        child: HomeScreenBody(),
      ),
    );
  }
}
