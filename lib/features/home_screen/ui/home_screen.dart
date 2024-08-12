import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_bottom_navigation_bar.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_screen_body.dart';

import '../logic/trending_movie_cubit/trending_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: SafeArea(
        child: BlocBuilder<TrendingCubit, TrendingState>(
          builder: (context, state) {
            final selectedIndex = context.read<TrendingCubit>().selectedIndex;
            return PageTransitionSwitcher(
              duration: const Duration(milliseconds: 700),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                  SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: ColorsManager.bodyApp,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
              child: HomeScreenBody(
                key: ValueKey<int>(selectedIndex),
                selectedIndex: selectedIndex,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
