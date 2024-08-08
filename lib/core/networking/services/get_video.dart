import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../features/details/data/models/video_lancher_model.dart';
import '../api_endpoints.dart';
import '../dio_helper.dart';

class GetVideo {
  static getVideo({required int id}) async {
    try {
      final response =
          await DioHelper.getData(path: ApiEndPoints.movieVideo(id));
      VideoLauncherModel videoLauncherModel =
          VideoLauncherModel.fromJson(response.data);

      return videoLauncherModel.results;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
