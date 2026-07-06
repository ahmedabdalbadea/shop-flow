import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/profile/view/widgets/order_item.dart';

class OrderSliverListContent extends StatelessWidget {
  const OrderSliverListContent({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: OrderItem(order: orders[index]),
        );
      },
    );
  }
}
