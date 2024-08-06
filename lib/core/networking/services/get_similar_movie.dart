import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import 'package:movie_app/core/networking/dio_helper.dart';

import '../../../features/home_screen/data/models/movie_model.dart';

class GetSimilarMovie {
  static Future<List<Movie>> getSimilar({
    required int id,
  }) async {
    try {
      final respone = await DioHelper.getData(
        path: ApiEndPoints.movieSimilar(
          id,
        ),
      );
      MoviesList movie = MoviesList.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
