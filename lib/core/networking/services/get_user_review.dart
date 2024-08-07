import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_endpoints.dart';
import 'package:movie_app/core/networking/dio_helper.dart';

import '../../../features/details/data/models/review_model.dart';

class GetUserReview {
 static Future<List<ReviewResult>> getReviews({required id}) async {
    try {
      final response = await DioHelper.getData(
          path: ApiEndPoints.movieReviews(
        id,
      ));
      Review review = Review.fromJson(response.data);
      return review.results!;
    } on DioException catch (e) {
      log(e.toString());
      return [];
    }
  }
}
