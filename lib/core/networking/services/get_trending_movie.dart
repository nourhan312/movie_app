import 'package:dio/dio.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';

import '../../../features/home_screen/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetTrendingMovie {
  static Future<List<Movie>> getTrendingMovie(
      {required String timeWindow}) async {
    try {
      final response = await DioHelper.getData(
          path: ApiEndPoints.movieTrending(timeWindow: timeWindow));
      MoviesList movie = MoviesList.fromJson(response.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
