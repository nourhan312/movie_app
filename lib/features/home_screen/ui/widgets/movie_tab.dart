import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/home_screen/ui/widgets/tap_bar_view_section.dart';

class MovieTabs extends StatefulWidget {
  const MovieTabs({super.key});

  @override
  _MovieTabsState createState() => _MovieTabsState();
}

class _MovieTabsState extends State<MovieTabs>
    with SingleTickerProviderStateMixin {
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
            indicatorColor: ColorsManager.mainBlue,
            indicatorSize: TabBarIndicatorSize.label,
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
          TabBarViewSection(tabController: _tabController),
        ],
      ),
    );
  }
}
