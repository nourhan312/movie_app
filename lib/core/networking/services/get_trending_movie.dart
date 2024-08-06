import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetTrendingMovie {
  static Future<List<Movie>> getTrendingMovie() async {
    try {
      final response = await DioHelper.getData(
          path: ApiEndPoints.movieTrending());
      MoviesList movie = MoviesList.fromJson(response.data);
      return movie.result;
    } on DioException catch (e) {
      log(e.toString());
      return [];
    }
  }
}
