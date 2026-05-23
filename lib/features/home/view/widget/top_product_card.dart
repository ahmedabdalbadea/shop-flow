import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';
import 'package:shop_flow/features/home/view/widget/top_product_card_info.dart';

class TopProductCard extends StatelessWidget {
  const TopProductCard({super.key, required this.product});
  final Product product;
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
          SizedBox(height: 150, child: ProductImage(image: product.thumbnail)),
          TopProductCardInfo(
            category: product.category ?? "Unknown",
            title: product.title ?? "Unknown",
            price: product.price.toString(),
            onAddTap: () {},
          ),
        ],
      ),
    );
  }
}
