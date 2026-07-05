import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(top: false, child: OrdersViewBody()));
  }
}
