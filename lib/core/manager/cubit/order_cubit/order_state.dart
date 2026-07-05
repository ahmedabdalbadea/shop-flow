part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderAddingSuccess extends OrderState {}

final class OrderAddingLoading extends OrderState {}

final class OrderAddingFailure extends OrderState {
  final String errMsg;

  OrderAddingFailure(this.errMsg);
}

final class OrdersSuccess extends OrderState {
  final List<OrderModel> orders;

  OrdersSuccess(this.orders);
}

final class OrdersLoading extends OrderState {}

final class OrdersFailure extends OrderState {
  final String errMsg;

  OrdersFailure(this.errMsg);
}
