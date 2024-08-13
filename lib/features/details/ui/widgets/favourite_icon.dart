import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details/data/models/movie_arg.dart';
import 'package:movie_app/features/details/ui/widgets/custom__icon_button.dart';
import '../../../fav/logic/fav_cubit.dart';
import '../../../fav/logic/fav_state.dart';


class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.movies,
  });

  final MovieArg movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (BuildContext context, state) {
        if (state is FavoritesLoaded) {
          final isFavoriteMovie = movies.movie != null
              ? state.movies.any((fav) => fav.id == movies.movie!.id)
              : false;

          final isFavoriteGenresMovie = movies.movieGenres != null
              ? state.genresMovies.any((fav) => fav.id == movies.movieGenres!.id)
              : false;
          final isFavorite = isFavoriteMovie || isFavoriteGenresMovie;

          return CustomIconButton(
            icon: CupertinoIcons.heart,
            iconColor: isFavorite ? Colors.red : Colors.white,
            onTap: () {
              if (movies.movie != null) {
                context.read<FavoritesCubit>().toggleFavoriteMovie(movies.movie!);
              } else if (movies.movieGenres != null) {
                context.read<FavoritesCubit>().toggleFavoriteGenresMovie(movies.movieGenres!);
              }
            },
            color: Colors.black87.withOpacity(0.8),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}