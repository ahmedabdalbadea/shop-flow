import 'package:flutter/material.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_product.dart';

class WishListSliverGrid extends StatelessWidget {
  const WishListSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.21,
      ),
      delegate: SliverChildBuilderDelegate(childCount: 6, (context, index) {
        return GestureDetector(onTap: () {}, child: WishListProduct());
      }),
    );
  }
}
