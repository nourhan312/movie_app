import 'package:dio/dio.dart';
import '../../../features/home_screen/data/models/movie_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetPopularMovies {
  static Future<List<Movie>> getPopularMovies() async {
    try {
      final respone = await DioHelper.getData(path: ApiEndPoints.popularMovies);
      MoviesList movie = MoviesList.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
