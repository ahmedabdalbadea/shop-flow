import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';
import 'package:shop_flow/features/home/view/widget/top_product_card_info.dart';

class TopProductCard extends StatelessWidget {
  const TopProductCard({
    super.key,
    required this.product,
    required this.onAddTap,
  });
  final Product product;
  final VoidCallback onAddTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context) * 0.63,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Hero(
              tag: "${product.id}",
              child: ProductImage(image: product.thumbnail),
            ),
          ),
          TopProductCardInfo(
            category: product.category ?? "Unknown",
            title: product.title ?? "Unknown",
            price: product.price.toString(),
            onAddTap: onAddTap,
          ),
        ],
      ),
    );
  }
}
