import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/product_card.dart';

class SearchProductsGrid extends StatelessWidget {
  const SearchProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.10,
      ),
      itemCount: 14,
      itemBuilder: (context, index) {
        return ProductCard(product: Product(title: "shoes", price: 19.19));
      },
    );
  }
}
