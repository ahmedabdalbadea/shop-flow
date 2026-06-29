import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/models/products/product.dart';

import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(this._wishListRepo) : super(WishListInitial());
  final WishListRepo _wishListRepo;
  StreamSubscription<Either<Failure, List<Product>>>? _streamSubscription;
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

  void getWishListProducts({required String uId}) {
    _streamSubscription?.cancel();

    emit(WishListLoading());

    _streamSubscription = _wishListRepo.getWishListProducts(uId: uId).listen((
      data,
    ) {
      data.fold(
        (failure) => emit(WishListFailure(failure.errMsg)),
        (products) => emit(WishListSuccess(products)),
      );
    });
  }

  Future<void> deleteFromWishList({
    required String uId,
    required Product product,
  }) async {
    var data = await _wishListRepo.deleteFromWishList(
      uId: uId,
      product: product,
    );
    data.fold(
      (failure) {
        emit(WishListFailure(failure.errMsg));
      },
      (_) {
        debugPrint("============ Deleted ============");
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
