import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/view/widgets/order_item.dart';

class OrderSliverList extends StatelessWidget {
  const OrderSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: OrderItem(),
        );
      },
    );
  }
}
