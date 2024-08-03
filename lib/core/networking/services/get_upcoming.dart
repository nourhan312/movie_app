import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';

import '../../../features/home/data/models/movie_model.dart';
import '../dio_helper.dart';

class GetUpcoming {
  static Future<List<ResultModel>> getTopRatedMovies() async {
    try {
      final respone =
          await DioHelper.getData(path: ApiEndPoints.upcomingMovies);
      Movie movie = Movie.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
