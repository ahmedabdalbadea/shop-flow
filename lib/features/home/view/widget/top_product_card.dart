import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
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
          SizedBox(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail ?? "",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Image.asset(
                    width: double.infinity,
                    Assets.imagesImageNotFound,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
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
