import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/category_badge.dart';
import 'package:shop_flow/features/home/view/widget/product_card_with_badge_info.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProductCardWithBadge extends StatelessWidget {
  const ProductCardWithBadge({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 115,
                child: ProductImage(image: product.thumbnail),
              ),
              ProductCardWithBadgeInfo(
                title: product.title ?? "Unkown",
                price: product.price.toString(),
              ),
            ],
          ),
          Positioned(
            top: 115 - 20,
            left: 12,
            child: CategoryBadge(category: product.category ?? 'Unknown'),
          ),
        ],
      ),
    );
  }
}
