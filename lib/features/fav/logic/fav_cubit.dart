
import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../core/helper/hive_helper.dart';
import '../../home_screen/data/models/movie_model.dart';
import 'fav_state.dart';


class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void loadFavorites() {
    final movies = HiveHelpers.getMovies();
    emit(FavoritesLoaded(movies));
  }

  void toggleFavorite(Movie movie) async {
    final currentState = state;
    if (currentState is FavoritesLoaded) {
      final currentFavorites = List<Movie>.from(currentState.favorites);
      if (currentFavorites.any((m) => m.id == movie.id)) {
        await HiveHelpers.removeMovie(movie.id);
        currentFavorites.removeWhere((m) => m.id == movie.id);
      } else {
        await HiveHelpers.addMovie(movie);
        currentFavorites.add(movie);
      }
      emit(FavoritesLoaded(currentFavorites));
    }
  }
}