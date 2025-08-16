import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';

@injectable
class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ServerException exception;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      exception = const NoInternetConnectionException();
    } else if (err.type == DioExceptionType.unknown) {
      exception = const NoInternetConnectionException();
    } else if (err.response != null) {
      final int statusCode = err.response?.statusCode ?? 0;
      switch (statusCode) {
        case 400:
          exception = const BadRequestException();
          break;
        case 401:
        case 403:
          exception = const UnauthorizedException();
          break;
        case 404:
          exception = const NotFoundException();
          break;
        case 409:
          exception = const ConflictException();
          break;
        case 500:
          exception = const InternalServerErrorException();
          break;
        default:
          exception = ServerException(
            'Error occurred with status code: $statusCode',
          );
      }
    } else {
      exception = const FetchDataException();
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
      ),
    );
  }
}
