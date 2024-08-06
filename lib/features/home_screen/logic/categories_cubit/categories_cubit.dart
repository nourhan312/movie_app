import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/networking/services/get_now_playing.dart';
import 'package:movie_app/core/networking/services/get_popular_movies.dart';
import 'package:movie_app/core/networking/services/get_top_rated.dart';
import 'package:movie_app/core/networking/services/get_upcoming.dart';

import '../../data/models/movie_model.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  //
  void getPopularMovies() async {
    emit(PopularMoviesLoading());
    try {
      List<Movie> movies = await GetPopularMovies.getPopularMovies();
      emit(PopularMoviesSuccess(movies));
    } catch (e) {
      emit(PopularMoviesError(e.toString()));
    }
  }

  void getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    try {
      List<Movie> movies = await GetTopRated.getTopRatedMovies();
      emit(TopRatedMoviesSuccess(movies));
    } catch (e) {
      emit(TopRatedMoviesError(e.toString()));
    }
  }

  void getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    try {
      List<Movie> movies = await GetNowPlaying.getNowPlayingMovies();
      emit(NowPlayingMoviesSuccess(movies));
    } catch (e) {
      emit(NowPlayingMoviesError(e.toString()));
    }
  }

  void getUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    try {
      List<Movie> movies = await GetUpcoming.getUpcomingMovies();
      emit(UpcomingMoviesSuccess(movies));
    } catch (e) {
      emit(UpcomingMoviesError(e.toString()));
    }
  }
}
