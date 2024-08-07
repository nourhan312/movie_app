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
  List<Movie> popularMovies = [];
  List<Movie> upComingMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> nowPlayingMovies = [];

  void getPopularMovies() async {
    emit(PopularMoviesLoading());
    try {
      popularMovies = await GetPopularMovies.getPopularMovies();
      emit(PopularMoviesSuccess());
    } catch (e) {
      emit(PopularMoviesError(e.toString()));
    }
  }

  void getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    try {
      topRatedMovies = await GetTopRated.getTopRatedMovies();
      emit(TopRatedMoviesSuccess());
    } catch (e) {
      emit(TopRatedMoviesError(e.toString()));
    }
  }

  void getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    try {
      nowPlayingMovies = await GetNowPlaying.getNowPlayingMovies();
      emit(NowPlayingMoviesSuccess());
    } catch (e) {
      emit(NowPlayingMoviesError(e.toString()));
    }
  }

  void getUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    try {
      upComingMovies = await GetUpcoming.getUpcomingMovies();
      emit(UpcomingMoviesSuccess());
    } catch (e) {
      emit(UpcomingMoviesError(e.toString()));
    }
  }
}
