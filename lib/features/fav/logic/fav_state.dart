
import '../../home_screen/data/models/movie_model.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Movie> favorites;

  FavoritesLoaded(this.favorites);
}