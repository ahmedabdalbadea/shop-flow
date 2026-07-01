import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/features/cart/data/cart_local_data_source.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._localDataSource) : super(CartInitial());
  final CartLocalDataSource _localDataSource;
  List<ProductCartModel> products = [];
  StreamSubscription? _subscription;
  Future<void> addProductToCart(ProductCartModel product) async {
    await _localDataSource.addProductToCart(product);
  }

  Future<void> deleteProductFromCart(int id) async {
    await _localDataSource.deleteProductFromCart(id);
  }

  void getCartProduct() {
    products = _localDataSource.getCartProducts();
    emit(CartProductsLoaded());
    _subscription?.cancel();

    _subscription = _localDataSource.watchCart().listen((_) {
      products = _localDataSource.getCartProducts();

      emit(CartProductsLoaded());
    });
  }

  double calcTotalPrice() => products.fold(
    0,
    (total, product) => total + (product.price * product.count),
  );

  double calcTax() => calcTotalPrice() * 0.08;

  double calcTotalPriceWithTax() => calcTotalPrice() + calcTax();

  void incrementProductcount(int id) async {
    await _localDataSource.incrementProductcount(id);
  }

  void decrementProductcount(int id) async {
    await _localDataSource.decrementProductcount(id);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
