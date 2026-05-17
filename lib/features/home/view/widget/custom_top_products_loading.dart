import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/top_product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomTopProductsLoading extends StatelessWidget {
  const CustomTopProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TopProductCard(
              product: Product(
                category: "sdlfsdjl",
                title: 'Girl Summer Dress',
                price: 19.99,
              ),
            ),
          );
        },
      ),
    );
  }
}
