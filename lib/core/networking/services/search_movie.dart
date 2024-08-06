import 'package:dio/dio.dart';
import '../../../features/home_screen/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class SearchMovie {
  static Future<List<Movie>> searchMoviesByQuery({
    required query,
  }) async {
    try {
      final respone = await DioHelper.getData(path: ApiEndPoints.search(query));
      MoviesList movie = MoviesList.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
