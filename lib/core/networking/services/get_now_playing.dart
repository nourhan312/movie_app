import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import 'package:movie_app/core/networking/dio_helper.dart';

import '../../../features/home/data/models/movie_model.dart';

class GetNowPlaying {
  static Future<List<ResultModel>> getTopRatedMovies() async {

    try {
      final respone =
          await DioHelper.getData(path: ApiEndPoints.nowPlayingMovies);
      Movie movie = Movie.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
