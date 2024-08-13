
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/hive_helper.dart';
import '../../genres/data/models/movies_depends_on_genre_id.dart';
import '../../home_screen/data/models/movie_model.dart';
import 'fav_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void loadFavorites() {
    final movies = HiveHelpers.getMovies();
    final genresMovies = HiveHelpers.getGenresMovies(); // Assuming you have a similar method for GenresMovies
    emit(FavoritesLoaded(movies: movies, genresMovies: genresMovies));
  }

  void toggleFavoriteMovie(Movie movie) async {
    final currentState = state;
    if (currentState is FavoritesLoaded) {
      final currentFavorites = List<Movie>.from(currentState.movies);
      if (currentFavorites.any((m) => m.id == movie.id)) {
        await HiveHelpers.removeMovie(movie.id);
        currentFavorites.removeWhere((m) => m.id == movie.id);
      } else {
        await HiveHelpers.addMovie(movie);
        currentFavorites.add(movie);
      }
      emit(FavoritesLoaded(movies: currentFavorites, genresMovies: currentState.genresMovies));
    }
  }

  void toggleFavoriteGenresMovie(GenresMovie genresMovie) async {
    final currentState = state;
    if (currentState is FavoritesLoaded) {
      final currentFavorites = List<GenresMovie>.from(currentState.genresMovies);
      if (currentFavorites.any((m) => m.id == genresMovie.id)) {
        await HiveHelpers.removeGenresMovie(genresMovie.id!);
        currentFavorites.removeWhere((m) => m.id == genresMovie.id);
      } else {
        await HiveHelpers.addGenresMovie(genresMovie);
        currentFavorites.add(genresMovie);
      }
      emit(FavoritesLoaded(movies: currentState.movies, genresMovies: currentFavorites));
    }
  }
}