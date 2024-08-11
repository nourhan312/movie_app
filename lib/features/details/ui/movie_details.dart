import 'package:flutter/material.dart';
import 'package:movie_app/features/details/ui/widgets/movie_details_bloc_builder.dart';
import '../../home_screen/data/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: MovieDetailsBlocBuilder(movie: movie),
    );
  }
}


