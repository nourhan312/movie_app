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
class PopularMoviesSuccess extends CategoriesState {}

class TopRatedMoviesSuccess extends CategoriesState {}

class NowPlayingMoviesSuccess extends CategoriesState {}

class UpcomingMoviesSuccess extends CategoriesState {}

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