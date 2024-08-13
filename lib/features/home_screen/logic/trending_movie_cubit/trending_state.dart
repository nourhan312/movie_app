part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesSuccess extends TrendingState {}


class TrendingMoviesError extends TrendingState {
  final String message;
  TrendingMoviesError(this.message);
}

final class TrendingTabChanged extends TrendingState {
  final int index;

  TrendingTabChanged({required this.index});
}
