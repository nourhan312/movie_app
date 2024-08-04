import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';

import 'movie_category.dart';

class MovieTabs extends StatefulWidget {
  const MovieTabs({super.key});

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
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            unselectedLabelColor: Colors.white.withOpacity(.4),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Popular'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Now Playing'),
            ],
          ),
          verticalSpace(10),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                MovieCategory(
                  movies: [
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: [
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: [
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: [
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

