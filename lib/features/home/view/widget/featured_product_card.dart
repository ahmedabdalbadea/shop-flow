import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/view/widget/featured_product_card_info.dart';

class FeaturedProductCard extends StatelessWidget {
  const FeaturedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              Assets.imagesFeaturedImageTest,
              fit: BoxFit.cover,
            ),
          ),
          FeaturedProductCardInfo(
            category: "AUDIO",
            title: "Sonic-X Wireless",
            price: "299.00",
            onAddTap: () {},
          ),
        ],
      ),
    );
  }
}
