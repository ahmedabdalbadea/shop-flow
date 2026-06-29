import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_product.dart';

class WishListSliverGrid extends StatelessWidget {
  const WishListSliverGrid({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.21,
      ),
      delegate: SliverChildBuilderDelegate(childCount: products.length, (
        context,
        index,
      ) {
        return GestureDetector(
          onTap: () {},
          child: WishListProduct(product: products[index]),
        );
      }),
    );
  }
}
