import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "All Products"),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
