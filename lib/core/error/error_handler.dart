import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_project/core/error/failures.dart';

class ErrorHandler {
  ErrorHandler();

  static Failure handle(Exception error) {
    if (error is DioException) {
      final String errorMessage = error.message ?? 'An unknown error occurred';

      switch (error.type) {
        case DioExceptionType.connectionError:
          if (error.error is SocketException) {
            return NetworkFailure(errorMessage: errorMessage);
          }
          return const UnknownFailure();

        case DioExceptionType.badResponse:
          return ServerFailure(errorMessage: errorMessage);

        case DioExceptionType.cancel:
          return CancelFailure(errorMessage: errorMessage);

        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return TimeoutFailure(errorMessage: errorMessage);

        case DioExceptionType.unknown:
        default:
          return UnknownFailure(errorMessage: errorMessage);
      }
    }

    return UnknownFailure(errorMessage: error.toString());
  }
}
