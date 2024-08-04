import 'package:dio/dio.dart';

import '../../../features/home/data/models/credits_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetCredits {
  static Future<Credits> getCredits({
    required int seriesId,
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    try {
      final response = await DioHelper.getData(
        path: ApiEndPoints.movieCredits(
          seriesId: seriesId,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber,
        ),
      );
      return Credits.fromJson(response.data);
    } on DioException catch (e) {
      print(e.toString());
      return Credits(cast: [], crew: [], guestStarts: [], id: -1);
    }
  }
}
