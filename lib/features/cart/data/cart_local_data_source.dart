import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';

class CartLocalDataSource {
  final Box<ProductCartModel> _cartBox = Hive.box<ProductCartModel>(
    kCartProductsBox,
  );

  Future<void> addProductToCart(ProductCartModel product) async {
    await _cartBox.put(product.id, product);
  }

  Future<void> deleteProductFromCart(int id) async {
    await _cartBox.delete(id);
  }

  List<ProductCartModel> getCartProducts() {
    return _cartBox.values.toList();
  }

  Stream<BoxEvent> watchCart() {
    return _cartBox.watch();
  }
}
