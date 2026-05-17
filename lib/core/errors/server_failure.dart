import 'package:dio/dio.dart';
import 'package:shop_flow/core/errors/failure.dart';

class ServerFailuer extends Failure {
  ServerFailuer(super.errMsg);

  factory ServerFailuer.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer(
          "Connection timeout, please check your internet connection",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailuer(
          "Request timeout while sending data, please try again",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailuer(
          "Request timeout while receiving data, please try again",
        );
      case DioExceptionType.badCertificate:
        return ServerFailuer("SSL certificate error, unable to verify server");
      case DioExceptionType.badResponse:
        return ServerFailuer.fromBadResponse(
          e.response!,
          e.response?.statusCode ?? 0,
        );
      case DioExceptionType.cancel:
        return ServerFailuer("Request was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailuer(
          "Connection error, please check your internet connection",
        );
      case DioExceptionType.unknown:
        return ServerFailuer("An unknown error occurred, please try again");
    }
  }

  factory ServerFailuer.fromBadResponse(Response response, int statusCode) {
    if (statusCode == 401 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response.data["message"]);
    } else if (statusCode == 404) {
      return ServerFailuer("The requested resource was not found");
    } else if (statusCode == 505) {
      return ServerFailuer("Server error, please try again later");
    } else {
      return ServerFailuer(
        response.data["message"] ?? "An error occurred, please try again",
      );
    }
  }
}
