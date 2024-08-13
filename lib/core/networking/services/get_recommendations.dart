import 'package:dio/dio.dart';

import '../../../features/home_screen/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetRecommendations{

  static Future<List<Movie>> getRecommendations({
    required int id,
  }) async {
    try {
      final respone = await DioHelper.getData(
        path: ApiEndPoints.movieRecommendations(
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