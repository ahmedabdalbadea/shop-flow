import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/core/models/products/products.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit(this._homeRepo) : super(SearchProductsInitial());
  final HomeRepo _homeRepo;
  Products? productsList;

  bool? searchFromRecent;

  TextEditingController? searchBarController;
  Future<void> searchProducts({required String product}) async {
    emit(SearchProductsLoading());
    var data = await _homeRepo.searchProducts(product: product);

    data.fold(
      (failure) {
        emit(SearchProductsFailure(errMsg: failure.errMsg));
      },
      (products) {
        productsList = products;
        emit(SearchProductsSuccess());
      },
    );
  }

  Future<void> searchProductsByCategory({required String category}) async {
    emit(SearchProductsByCategoryLoading());
    var data = await _homeRepo.fetchProductsByCategory(category: category);

    data.fold(
      (failure) {
        emit(SearchProductsFailure(errMsg: failure.errMsg));
      },
      (products) {
        productsList = products;
        emit(SearchProductsByCategorySuccess());
      },
    );
  }
}
