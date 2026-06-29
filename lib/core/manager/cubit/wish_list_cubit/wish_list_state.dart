part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class WishListSuccess extends WishListState {
  final List<Product> products;

  WishListSuccess(this.products);
}

final class WishListLoading extends WishListState {}

final class WishListFailure extends WishListState {
  final String errMsg;

  WishListFailure(this.errMsg);
}

final class WishListAddingSuccess extends WishListState {}

final class WishListAddingLoading extends WishListState {}

final class WishListAddingFailure extends WishListState {
  final String errMsg;

  WishListAddingFailure(this.errMsg);
}
