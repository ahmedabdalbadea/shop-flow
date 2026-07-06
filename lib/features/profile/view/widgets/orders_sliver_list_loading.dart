import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/view/widgets/order_skeleton_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersSliverListLoading extends StatelessWidget {
  const OrdersSliverListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverList.builder(
        itemCount: 3,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: OrderSkeletonItem(),
        ),
      ),
    );
  }
}
