
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/trending_movie_cubit/trending_cubit.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        final selectedIndex = context.read<TrendingCubit>().selectedIndex;
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) => context.read<TrendingCubit>().selectTab(index),
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xff242A32),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff242A32),
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff242A32),
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff242A32),
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
          ],
        );
      },
    );
  }
}
