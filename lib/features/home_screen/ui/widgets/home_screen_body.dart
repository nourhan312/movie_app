import 'package:flutter/material.dart';
import 'package:movie_app/features/genres/ui/categories_screen.dart';
import '../../../fav/ui/fav_screen.dart';
import '../../../search/ui/search_screen.dart';
import 'home.dart';

class HomeScreenBody extends StatelessWidget {
  final PageController pageController;

  const HomeScreenBody({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const Home(),
      const SearchScreen(),
      const FavoritesScreen(),
      const CategoriesScreen(),
    ];
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
    );
  }
}

