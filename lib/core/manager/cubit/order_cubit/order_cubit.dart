import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/features/profile/data/repos/profile_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._profileRepo) : super(OrderInitial());
  String paymentMethod = "Credit / Debit Card";
  final ProfileRepo _profileRepo;
  StreamSubscription? _subscription;
  Future<void> createOrder({
    required String uId,
    required double totalAmount,
    required List<ProductCartModel> products,
  }) async {
    emit(OrderAddingLoading());

    var response = await _profileRepo.createOrder(
      uId: uId,
      totalAmount: totalAmount,
      products: products,
      paymentMethod: paymentMethod,
    );

    response.fold(
      (failure) {
        emit(OrderAddingFailure(failure.errMsg));
      },
      (_) {
        emit(OrderAddingSuccess());
      },
    );
  }

  void fetchOrders({required String uId, String? filter}) {
    emit(OrdersLoading());
    _subscription?.cancel();
    _subscription = _profileRepo.fetchOrders(uId: uId, filter: filter).listen((
      event,
    ) {
      event.fold(
        (failure) {
          emit(OrdersFailure(failure.errMsg));
        },
        (orders) {
          emit(OrdersSuccess(orders));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
