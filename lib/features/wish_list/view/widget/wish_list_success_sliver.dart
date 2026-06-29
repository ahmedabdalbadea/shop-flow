import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_header.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_sliver_grid.dart';

class WishListSuccessSliver extends StatelessWidget {
  const WishListSuccessSliver({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: WishListHeader(itemsCount: products.length),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),

        SliverPadding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          sliver: WishListSliverGrid(products: products),
        ),
      ],
    );
  }
}
