import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(top: false, child: const CartViewBody()));
  }
}
