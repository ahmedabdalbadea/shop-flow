import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_header.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_sliver_grid.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "ShopFlow"),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: WishListHeader(itemsCount: 6),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),

        SliverPadding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          sliver: const WishListSliverGrid(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
