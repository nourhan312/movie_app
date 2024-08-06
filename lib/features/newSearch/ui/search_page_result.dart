import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:movie_app/features/newSearch/ui/no_result_page.dart';
import 'package:movie_app/features/newSearch/widgets/movie_card.dart';

class SearchResultsPage extends StatelessWidget {
  final List<Movie> resultmodel;

  SearchResultsPage({required this.resultmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      body: resultmodel.isEmpty
          ?  Center(
        child: NoResultsPage(),
      )
          : ListView.builder(
        itemCount: resultmodel.length,
        itemBuilder: (context, index) {
          final movie = resultmodel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieCard(movie: movie,)
          );
        },
      ),
    );
  }
}

