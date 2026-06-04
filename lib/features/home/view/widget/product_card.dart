import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/all_product_card_info.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 115,
            child: Hero(
              tag: "${product.id}",
              child: ProductImage(image: product.thumbnail),
            ),
          ),
          AllProductCardInfo(
            title: product.title ?? "Unknown",
            price: product.price.toString(),
          ),
        ],
      ),
    );
  }
}
