import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

part 'top_products_state.dart';

class TopProductsCubit extends Cubit<TopProductsState> {
  TopProductsCubit(this._homeRepo) : super(TopProductsInitial());
  final HomeRepo _homeRepo;
  Future<void> getTopProducts() async {
    emit(TopProductsLoading());

    var data = await _homeRepo.fetchProductsByCategory(category: "tops");

    data.fold(
      (failure) {
        emit(TopProductsFailure(errMsg: failure.errMsg));
      },
      (products) {
        emit(TopProductsSuccess(products: products));
      },
    );
  }
}
