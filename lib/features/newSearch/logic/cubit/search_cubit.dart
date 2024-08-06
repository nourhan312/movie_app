import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:movie_app/features/newSearch/logic/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovie searchMovie;

  SearchCubit(this.searchMovie) : super(SearchInitial());

  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      emit(SearchLoading());
      try {
        final movies = await SearchMovie.searchMoviesByQuery(query: query);
        emit(SearchSuccess(movies));
      } catch (e) {
        emit(SearchError('Error searching movies: $e'));
      }
    } else {
      emit(SearchInitial());
    }
  }
}
