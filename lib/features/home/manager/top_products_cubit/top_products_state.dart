part of 'top_products_cubit.dart';

@immutable
sealed class TopProductsState {}

final class TopProductsInitial extends TopProductsState {}

final class TopProductsLoading extends TopProductsState {}

final class TopProductsSuccess extends TopProductsState {
  final Products products;

  TopProductsSuccess({required this.products});
}

final class TopProductsFailure extends TopProductsState {
  final String errMsg;

  TopProductsFailure({required this.errMsg});
}
