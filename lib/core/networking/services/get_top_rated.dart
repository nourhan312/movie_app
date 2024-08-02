import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/networking/dio_helper.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class GetTopRated {
  static Future<List<ResultModel>> getTopRatedMovies() async {
    try {
      final respone = await DioHelper.getData(path: ApiEndPoints.ratedMovies);
      Movie movie = Movie.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
