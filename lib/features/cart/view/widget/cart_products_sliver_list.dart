import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/cart_product.dart';

class CartProductsSliverList extends StatelessWidget {
  const CartProductsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CartProduct(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            title: "Velocity Nitro 2",
            price: 120.00,
            image:
                "https://cdn.dummyjson.com/product-images/tops/blue-frock/thumbnail.webp",
          ),
        );
      },
    );
  }
}
