import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/errors/remote_data_source_failuer.dart';
import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/features/profile/data/profile_remote_data_source.dart';
import 'package:shop_flow/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _dataSource;

  ProfileRepoImpl(this._dataSource);
  @override
  Future<Either<Failure, void>> createOrder({
    required String uId,
    required double totalAmount,
    required List<ProductCartModel> products,
    required String paymentMethod,
  }) async {
    try {
      await _dataSource.createOrder(
        uId: uId,
        order: OrderModel(
          orderId: generateOrderId(),
          time: Timestamp.now(),
          totalAmount: totalAmount,
          products: products,
          orderState: "Processing",
          paymentMethod: paymentMethod,
        ),
      );

      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(RemoteDataSourceFailure.fromFirebaseException(e));
      } else {
        return left(RemoteDataSourceFailure(e.toString()));
      }
    }
  }

  String generateOrderId() => "#SF-${10000 + Random().nextInt(90000)}";

  @override
  Stream<Either<Failure, List<OrderModel>>> fetchOrders({
    required String uId,
    String? filter,
  }) async* {
    try {
      await for (final querySnapshot in _dataSource.fetchOrders(
        uId: uId,
        filter: filter,
      )) {
        final orders = querySnapshot.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList();

        yield right(orders);
      }
    } on FirebaseException catch (e) {
      yield left(RemoteDataSourceFailure.fromFirebaseException(e));
    } catch (e) {
      yield left(RemoteDataSourceFailure(e.toString()));
    }
  }
}
