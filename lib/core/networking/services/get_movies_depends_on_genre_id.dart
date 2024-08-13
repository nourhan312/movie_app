
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import '../../../features/genres/data/models/movies_depends_on_genre_id.dart';
import '../dio_helper.dart';

class GetMoviesDependsOnGenreId {
  static Future<List<GenresMovie>?> getMovies({ required int genreId}) async {
    try {
      final response = await DioHelper.getData(path: ApiEndPoints.getMovieDependsOnGenreId(genreId));
      MoviesDependsOnGenreId movie = MoviesDependsOnGenreId.fromJson(response.data);
      return movie.results ;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}