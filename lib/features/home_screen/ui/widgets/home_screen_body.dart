import 'package:flutter/material.dart';
import '../../../fav/ui/fav_screen.dart';
import '../../../search/ui/search_screen.dart';
import 'home.dart';

class HomeScreenBody extends StatelessWidget {
  final int selectedIndex;

  const HomeScreenBody({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const Home();
      case 1:
        return const SearchScreen();
      case 2:
        return const FavoritesScreen();
      case 3:
        return const Center(child: Text('Categories Screen Content'));
      case 4:
        return const Center(child: Text('Profile Screen Content'));
      default:
        return const Center(child: Text('Home Screen Content'));
    }
  }
}

