part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

// Loading States
class PopularMoviesLoading extends CategoriesState {}

class TopRatedMoviesLoading extends CategoriesState {}

class NowPlayingMoviesLoading extends CategoriesState {}

class UpcomingMoviesLoading extends CategoriesState {}

// Success States
class PopularMoviesSuccess extends CategoriesState {
  final List<Movie> movies;
  PopularMoviesSuccess(this.movies);
}

class TopRatedMoviesSuccess extends CategoriesState {
  final List<Movie> movies;
  TopRatedMoviesSuccess(this.movies);
}

class NowPlayingMoviesSuccess extends CategoriesState {
  final List<Movie> movies;
  NowPlayingMoviesSuccess(this.movies);
}

class UpcomingMoviesSuccess extends CategoriesState {
  final List<Movie> movies;
  UpcomingMoviesSuccess(this.movies);
}

// Error States
class PopularMoviesError extends CategoriesState {
  final String message;
  PopularMoviesError(this.message);
}

class TopRatedMoviesError extends CategoriesState {
  final String message;
  TopRatedMoviesError(this.message);
}

class NowPlayingMoviesError extends CategoriesState {
  final String message;
  NowPlayingMoviesError(this.message);
}

class UpcomingMoviesError extends CategoriesState {
  final String message;
  UpcomingMoviesError(this.message);
}
