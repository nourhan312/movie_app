import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/widgets/movie_category.dart';

class MovieTabs extends StatefulWidget {
  @override
  _MovieTabsState createState() => _MovieTabsState();
}

class _MovieTabsState extends State<MovieTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Popular'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Now Playing'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MovieCategory(
                  movies: const [
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

