import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/profile/view/widgets/order_product.dart';

class ExpandablePageViewOrderProduct extends StatelessWidget {
  const ExpandablePageViewOrderProduct({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: order.products.length,
      itemBuilder: (context, index) {
        return OrderProduct(product: order.products[index]);
      },
    );
  }
}
