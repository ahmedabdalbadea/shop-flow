import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/errors/remote_data_source_failuer.dart';
import 'package:shop_flow/core/errors/server_failure.dart';
import 'package:shop_flow/core/utils/api_service.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/features/home/data/home_remote_data_source.dart';
import 'package:shop_flow/core/models/products/products.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;
  final HomeRemoteDataSource _dataSource;
  HomeRepoImpl(this._apiService, this._dataSource);
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

  @override
  Future<Either<Failure, List<dynamic>>> fetchCategoryList() async {
    try {
      List<dynamic> data = await _apiService.get(
        endPoints: "products/category-list",
      );

      return right(data);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      } else {
        return left(ServerFailuer("An error occurred, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, Products>> searchProducts({
    required String product,
  }) async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoints: "products/search?q=$product",
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
  Future<Either<Failure, UserModel>> getUserInfo(String uId) async {
    try {
      final userData = await _dataSource.getUserData(uId: uId);

      if (userData != null) {
        return right(UserModel.fromJson(userData));
      } else {
        return left(RemoteDataSourceFailure("User data not found"));
      }
    } catch (e) {
      return left(RemoteDataSourceFailure(e.toString()));
    }
  }
}
