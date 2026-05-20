import 'dart:async';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  final _baseUrl = "https://dummyjson.com/";

  Future<dynamic> get({required String endPoints}) async {
    final Response response = await _dio.get("$_baseUrl$endPoints");

    return response.data;
  }
}
