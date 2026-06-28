import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/core/models/products/product.dart';

import 'package:shop_flow/core/models/products/products.dart';
import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(this._wishListRepo) : super(WishListInitial());
  final WishListRepo _wishListRepo;
  Future<void> addProductToWishList({
    required String uId,
    required Product product,
  }) async {
    emit(WishListAddingLoading());
    var data = await _wishListRepo.addProductToWishList(
      uId: uId,
      product: product,
    );
    data.fold(
      (failure) {
        emit(WishListAddingFailure(failure.errMsg));
      },
      (_) {
        emit(WishListAddingSuccess());
      },
    );
  }
}
