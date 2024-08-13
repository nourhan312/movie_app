import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/flutter_toast.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_bottom_navigation_bar.dart';
import 'package:movie_app/features/home_screen/ui/widgets/home_screen_body.dart';
import '../../../core/internet_check/cubit/internet_check__cubit.dart';
import '../../../core/internet_check/widgets/no_internet_connection.dart';
import '../logic/trending_movie_cubit/trending_cubit.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(initialPage: 0);
  final NotchBottomBarController controller = NotchBottomBarController(index: 0);
  @override
  void dispose() {
    pageController.dispose();
    controller.dispose();
    super.dispose();
  }
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
        extendBody: true,
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
                    return HomeScreenBody(
                      pageController: pageController,
                    );
                  },
                );
              }
            },
          ),
        ),
        bottomNavigationBar: HomeBottomNavigationBar(
          controller: controller,
          pageController: pageController,
        ),
      ),
    );
  }
}