import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/core/models/products/products.dart';

abstract class HomeRepo {
  Future<Either<Failure, Products>> fetchProductsByCategory({
    required String category,
  });

  Future<Either<Failure, Products>> fetchAllProducts();
  Future<Either<Failure, List<dynamic>>> fetchCategoryList();

  Future<Either<Failure, Products>> searchProducts({required String product});

  Future<Either<Failure, UserModel>> getUserInfo(String uId);
}
