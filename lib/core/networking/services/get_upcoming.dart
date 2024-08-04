import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';

import '../../../features/home_screen/data/models/movie_model.dart';
import '../dio_helper.dart';

class GetUpcoming {
  static Future<List<Movie>> getTopRatedMovies() async {
    try {
      final respone =
          await DioHelper.getData(path: ApiEndPoints.upcomingMovies);
      MoviesList movie = MoviesList.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
