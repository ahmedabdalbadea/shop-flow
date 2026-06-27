import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/category_badge.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_product_info.dart';

class WishListProduct extends StatelessWidget {
  const WishListProduct({super.key});

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
              SizedBox(height: 115, child: ProductImage(image: "")),
              WishListProductInfo(
                title: "Nordic Ceramic Watch",
                price: "180.00",
              ),
            ],
          ),
          Positioned(
            top: 115 - 20,
            left: 12,
            child: CategoryBadge(category: 'Unknown'),
          ),
        ],
      ),
    );
  }
}
