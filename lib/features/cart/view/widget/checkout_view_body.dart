import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/checkout_sliver_app_bar.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CheckoutSliverAppBar(title: "Checkout"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
