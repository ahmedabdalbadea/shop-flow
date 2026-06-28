import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/info_card.dart';

class ProductHighlights extends StatelessWidget {
  const ProductHighlights({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            icon: Icons.inventory_2_outlined,
            title: product.availabilityStatus!,
            subTitle: product.shippingInformation!,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InfoCard(
            icon: Icons.verified_user_outlined,
            title: product.warrantyInformation!,
            subTitle: product.returnPolicy!,
          ),
        ),
      ],
    );
  }
}
