
import '../../genres/data/models/movies_depends_on_genre_id.dart';
import '../../home_screen/data/models/movie_model.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Movie> movies;
  final List<GenresMovie> genresMovies;

  FavoritesLoaded({
    required this.movies,
    required this.genresMovies,
  });
}