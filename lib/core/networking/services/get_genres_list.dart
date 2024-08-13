


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/features/genres/data/models/genres_details.dart';

import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetGenresList {
  static getDetails() async {
    try {
      final response =
      await DioHelper.getData(path: ApiEndPoints.genresList);
      GenresDetails genersDetails = GenresDetails.fromJson(response.data);

      return genersDetails.genres;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
