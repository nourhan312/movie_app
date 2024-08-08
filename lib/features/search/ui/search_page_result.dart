import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:movie_app/features/search/ui/widgets/movie_card.dart';

import 'no_result_page.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key, required this.resultmodel});
  final List<Movie> resultmodel;

  @override
  Widget build(BuildContext context) {
    return resultmodel.isEmpty
        ? const Center(
            child: NoResultsPage(),
          )
        : ListView.builder(
            itemCount: resultmodel.length,
            itemBuilder: (context, index) {
              final movie = resultmodel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MovieCard(
                  movie: movie,
                ),
              );
            },
          );
  }
}
