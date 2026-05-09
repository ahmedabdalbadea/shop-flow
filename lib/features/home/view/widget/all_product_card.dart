import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/all_product_card_info.dart';

class AllProductCard extends StatelessWidget {
  const AllProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });
  final String image, title, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(image),
          ),
          AllProductCardInfo(title: title, price: price),
        ],
      ),
    );
  }
}
