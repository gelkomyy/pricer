/* import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with server');
      case DioExceptionType.badResponse:
        return ServerFailure(
            dioException.message ?? 'Bad response with server');
      case DioExceptionType.cancel:
        return ServerFailure('request canceled with server');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Connection error with server, Check you internet');
      case DioExceptionType.unknown:
        return ServerFailure('There waso an unknown error, Please try again');
      default:
        return ServerFailure('There waso an error, Please try again');
    }
  }
}
 */