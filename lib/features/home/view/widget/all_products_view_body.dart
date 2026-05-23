import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/all_products_sliver_grid.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
        overscroll: false,
      ),
      slivers: const [
        CustomSliverAppBar(title: "All Products"),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
          sliver: AllProductsSliverGrid(),
        ),
      ],
    );
  }
}
