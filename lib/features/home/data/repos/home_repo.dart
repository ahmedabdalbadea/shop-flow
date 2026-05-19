import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/home/data/models/products/products.dart';

abstract class HomeRepo {
  Future<Either<Failure, Products>> fetchProductsByCategory({
    required String category,
  });

  Future<Either<Failure, Products>> fetchAllProducts();
}
