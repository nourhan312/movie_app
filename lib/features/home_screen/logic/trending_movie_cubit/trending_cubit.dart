import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/networking/services/get_trending_movie.dart';

import '../../data/models/movie_model.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());
  List<Movie> trendingMovies = [];


  void getTrendingMovies () async
  {
    emit(TrendingMoviesLoading());
    try {
      trendingMovies = await GetTrendingMovie.getTrendingMovie();
      emit(TrendingMoviesSuccess());
    } catch (e) {
      emit(TrendingMoviesError(e.toString()));
    }
  }
  int selectedIndex = 0;
  void selectTab(int index) {
    selectedIndex = index;
    emit(TrendingTabChanged(index: index));
  }
}
