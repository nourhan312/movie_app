import 'package:flutter/material.dart';
import 'package:movie_app/features/details/data/models/movie_arg.dart';
import 'package:movie_app/features/details/ui/widgets/movie_details_bloc_builder.dart';

class MovieDetails extends StatelessWidget {
  const  MovieDetails({super.key, required this.movies});
  final MovieArg movies ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: MovieDetailsBlocBuilder(movies: movies),
    );
  }
}


