import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> createOrder({
    required String uId,
    required double totalAmount,
    required List<ProductCartModel> products,
    required String paymentMethod,
  });

  Stream<Either<Failure, List<OrderModel>>> fetchOrders({
    required String uId,
    String? filter,
  });
}
