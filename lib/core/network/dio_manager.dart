import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
@immutable
final class DioManager {
  final String baseUrl;
  late final Dio _dio;

  DioManager({
    @Named('baseUrl') required this.baseUrl,
  }) {
    _dio = _createDio();
  }

  Dio get dio => _dio;

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    // Add error handling interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          // Handle common errors
          if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
            // You could retry the request here
            // or transform the error
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
