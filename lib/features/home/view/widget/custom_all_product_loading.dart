import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAllProductLoading extends StatelessWidget {
  const CustomAllProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.10,
        children: List.generate(
          4,
          (index) => ProductCard(
            product: Product(title: "titel title title title", price: 12.12),
          ),
        ),
      ),
    );
  }
}
