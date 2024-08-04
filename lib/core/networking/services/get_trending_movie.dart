import 'package:dio/dio.dart';

import '../../../features/home/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetTrendingMovie {
  static Future<List<ResultModel>> getTrendingMovie(
      {required String timeWindow}) async {
    try {
      final response = await DioHelper.getData(
          path: ApiEndPoints.movieTrending(timeWindow: timeWindow));
      Movie movie = Movie.fromJson(response.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
