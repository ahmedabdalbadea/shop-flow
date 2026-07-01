import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(top: false, child: CheckoutViewBody()));
  }
}
