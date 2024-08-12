import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/core/widgets/flutter_toast.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_bottom_navigation_bar.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_screen_body.dart';
import '../../../core/internet_check/cubit/internet_check__cubit.dart';
import '../../../core/internet_check/widgets/no_internet_connection.dart';
import '../logic/trending_movie_cubit/trending_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityDisconnected) {
          showFlutterToastError("No Internet Connection");
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: SafeArea(
          child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
            builder: (context, connectivityState) {
              if (connectivityState is ConnectivityDisconnected) {
                return const Center(
                  child: NoInternetWidget(),
                );
              } else {
                return BlocBuilder<TrendingCubit, TrendingState>(
                  builder: (context, trendingState) {
                    final selectedIndex =
                        context.read<TrendingCubit>().selectedIndex;
                    return PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 700),
                      transitionBuilder: (child, primaryAnimation,
                          secondaryAnimation) =>
                          SharedAxisTransition(
                            animation: primaryAnimation,
                            secondaryAnimation: secondaryAnimation,
                            fillColor: ColorsManager.bodyApp,
                            transitionType:
                            SharedAxisTransitionType.horizontal,
                            child: child,
                          ),
                      child: HomeScreenBody(
                        key: ValueKey<int>(selectedIndex),
                        selectedIndex: selectedIndex,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        bottomNavigationBar: const HomeBottomNavigationBar(),
      ),
    );
  }
}