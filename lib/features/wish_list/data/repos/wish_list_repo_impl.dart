import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/errors/remote_data_source_failuer.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';
import 'package:shop_flow/features/wish_list/data/wish_list_remote_data_source.dart';

class WishListRepoImpl implements WishListRepo {
  final WishListRemoteDataSource _dataSource;

  WishListRepoImpl(this._dataSource);
  @override
  Future<Either<Failure, void>> addProductToWishList({
    required String uId,
    required Product product,
  }) async {
    try {
      await _dataSource.addProductToWishList(uId: uId, product: product);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(RemoteDataSourceFailure.fromFirebaseException(e));
      } else {
        return left(RemoteDataSourceFailure(e.toString()));
      }
    }
  }
}
