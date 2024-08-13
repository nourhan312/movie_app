part of 'genres_cubit.dart';

@immutable
sealed class GenresState {}

final class GenresInitial extends GenresState {}


final class GenresLoading extends GenresState {}

final class GenresSuccess extends GenresState {}

final class GenresError extends GenresState {

  final String error;
  GenresError({required this.error});


}

final class GetMoviesGenresLoading extends GenresState {}

final class GetMoviesGenresSuccess extends GenresState {}

final class GetMoviesGenresError extends GenresState {
  final String error;
  GetMoviesGenresError({required this.error});
}