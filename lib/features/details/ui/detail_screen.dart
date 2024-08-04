import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'About Movie'),
              Tab(text: 'Reviews'),
              Tab(text: 'Cast'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AboutMovieTab(),
            ReviewsTab(),
            CastTab(),
          ],
        ),
      ),
    );
  }
}
