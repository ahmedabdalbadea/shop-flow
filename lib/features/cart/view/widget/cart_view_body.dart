import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/cart_products_sliver_list.dart';
import 'package:shop_flow/features/cart/view/widget/cart_header.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Shop Flow"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CartHeader(title: "Your Cart", itemsCount: 3),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const CartProductsSliverList(),
        const SliverToBoxAdapter(child: SizedBox(height: 24 - 8)),
      ],
    );
  }
}
