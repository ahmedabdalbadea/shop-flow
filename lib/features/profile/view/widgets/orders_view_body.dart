import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/secondary_sliver_app_bar.dart';
import 'package:shop_flow/features/profile/view/widgets/order_sliver_list.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_filter.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_header.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SecondarySliverAppBar(title: "ShopFlow"),
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
        const SliverToBoxAdapter(child: SizedBox(height: 8)),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          sliver: OrderSliverList(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
