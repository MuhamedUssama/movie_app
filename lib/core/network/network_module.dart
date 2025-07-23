import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/di/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();

    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(getIt<PrettyDioLogger>());

    return dio;
  }

  @injectable
  PrettyDioLogger prettyDioLogger() {
    return PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    );
  }
}
