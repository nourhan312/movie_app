import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import 'package:movie_app/core/networking/dio_helper.dart';

import '../../../features/home/data/models/movie_model.dart';

class GetSimilarMovie {
  static Future<List<ResultModel>> getSimilar({
    required int id,
  }) async {
    try {
      final respone = await DioHelper.getData(
        path: ApiEndPoints.movieSimilar(
          id,
        ),
      );
      Movie movie = Movie.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
