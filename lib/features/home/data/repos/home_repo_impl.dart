import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/errors/server_failure.dart';
import 'package:shop_flow/core/utils/api_service.dart';
import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<Either<Failure, Products>> fetchProductsByCategory({
    required String category,
  }) async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoints: "products/category/$category?sortBy=rating&order=desc",
      );

      return right(Products.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      } else {
        return left(ServerFailuer("An error occurred, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, Products>> fetchAllProducts() async {
    try {
      Map<String, dynamic> data = await _apiService.get(endPoints: "products");

      return right(Products.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      } else {
        return left(ServerFailuer("An error occurred, please try again"));
      }
    }
  }
}
