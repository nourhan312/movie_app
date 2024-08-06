import 'package:dio/dio.dart';

import '../../../features/details/data/models/movie_credits.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetCredits {
  static Future<MovieCredits> getCredits({
    required int movieId,
  }) async {
    try {
      final response = await DioHelper.getData(
        path: ApiEndPoints.movieCredits(
          movieId: movieId,
        ),

      );
      return MovieCredits.fromJson(response.data);
    } on DioException catch (e) {
      print(e.toString());
      return MovieCredits(cast: [], crew: [], id: -1);
    }
  }
}
