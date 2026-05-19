import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this._homeRepo) : super(AllProductsInitial());
  final HomeRepo _homeRepo;
  Future<void> getAllProducts() async {
    emit(AllProductsLoading());

    var data = await _homeRepo.fetchAllProducts();

    data.fold(
      (failure) {
        emit(AllProductsFailure(errMsg: failure.errMsg));
      },
      (products) {
        emit(AllProductsSuccess(products: products));
      },
    );
  }
}
