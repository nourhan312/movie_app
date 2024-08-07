import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import 'package:movie_app/core/networking/dio_helper.dart';

import '../../../features/details/data/models/review_model.dart';

class GetUserReview {
  static Future<List<Review>> getReviews({required int id}) async {
    try {
      final response = await DioHelper.getData(
        path: ApiEndPoints.movieReviews(id),
      );
      MovieReviewPage reviewPage = MovieReviewPage.fromJson(response.data);
      return reviewPage.results;
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      return [];
    }
  }
}
