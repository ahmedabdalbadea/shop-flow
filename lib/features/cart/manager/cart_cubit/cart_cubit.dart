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

  Future<void> addProductToCart(ProductCartModel product) async {
    await _localDataSource.addProductToCart(product);
  }

  Future<void> deleteProductFromCart(int id) async {
    await _localDataSource.deleteProductFromCart(id);
  }
}
