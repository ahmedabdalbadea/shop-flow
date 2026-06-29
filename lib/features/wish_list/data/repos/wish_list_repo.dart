import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/models/products/product.dart';

abstract class WishListRepo {
  Future<Either<Failure, void>> addProductToWishList({
    required String uId,
    required Product product,
  });

  Stream<Either<Failure, List<Product>>> getWishListProducts({
    required String uId,
  });

  Future<Either<Failure, void>> deleteFromWishList({
    required String uId,
    required Product product,
  });
}
