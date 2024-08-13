import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/networking/services/get_genres_list.dart';
import '../../../core/networking/services/get_movies_depends_on_genre_id.dart';
import '../data/models/genres_details.dart';
import '../data/models/movies_depends_on_genre_id.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit() : super(GenresInitial());
  List <Genres> ? genres;
  List<GenresMovie>? moviesDependsOnGenreId;
  void getGenres()  async{
    emit(GenresLoading());
    try{
      genres =  await GetGenresList.getDetails();
      emit(GenresSuccess());
    }catch(e){
      emit(GenresError(error: e.toString()));
    }
  }


  void getMoviesDependsOnGenreId({required int id })  async{
    emit(GetMoviesGenresLoading());
    try{
      moviesDependsOnGenreId =  await GetMoviesDependsOnGenreId.getMovies (genreId: id);
      emit(GetMoviesGenresSuccess());
    }catch(e){
      emit(GetMoviesGenresError(error: e.toString()));
    }
  }
}
