import 'package:dio/dio.dart';

import '../../../features/home/data/models/movie_model.dart';
import '../api_constant.dart';
import '../dio_helper.dart';

class GetPopularMovies {
  Future<List<ResultModel>> getPopularMovies() async {
    try {
      final respone = await DioHelper.getData(path: ApiEndPoints.popularMovies);
      Movie movie = Movie.fromJson(respone.data);
      return movie.result;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
