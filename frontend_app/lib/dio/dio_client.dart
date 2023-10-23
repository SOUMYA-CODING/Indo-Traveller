import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend_app/constants/api_constants.dart';

class DioClient {
  Dio dio;
  static DioClient? _instance;

  DioClient._internal()
      : dio = Dio(
          BaseOptions(
            baseUrl: kReleaseMode
                ? AppApiConstants.productionApiUrl
                : AppApiConstants.debugApiUrl,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor());
    }
  }

  factory DioClient() {
    _instance ??= DioClient._internal();
    return _instance!;
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get<T>(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw DioErrorDescription('Failed to make GET request: ${e.toString()}');
    }
  }

  Future<Response<T>> post<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.post<T>(path, data: data, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw DioErrorDescription('Failed to make POST request: ${e.toString()}');
    }
  }
}

class DioErrorDescription implements Exception {
  final String message;

  DioErrorDescription(this.message);

  @override
  String toString() {
    return message;
  }
}
