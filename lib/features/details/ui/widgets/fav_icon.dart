import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import '../../../fav/logic/fav_cubit.dart';
import '../../../fav/logic/fav_state.dart';

class FavIcon extends StatelessWidget {
  final Movie movie;
  const FavIcon({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          log(state.favorites.length.toString());
          final isFavorite = state.favorites.any((fav) => fav.id == movie.id);
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () => context.read<FavoritesCubit>().toggleFavorite(movie),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}