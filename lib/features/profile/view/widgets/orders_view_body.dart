import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(title: "ShopFlow"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
