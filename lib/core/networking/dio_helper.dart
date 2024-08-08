import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();
  static DioHelper instance = DioHelper._();
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'e144d2f7753e7f552dd6b2aea2beafb4';
  static const imageBaseUrl = "https://image.tmdb.org/t/p/original/";

  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
        queryParameters: {
          'api_key': apiKey,
        },
      ),
    );
  }

   Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.post(
      path,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(
      path,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }
}