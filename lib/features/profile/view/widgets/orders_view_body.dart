import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_filter.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_header.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(title: "ShopFlow"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: OrdersHeader(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: OrdersFilter(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
