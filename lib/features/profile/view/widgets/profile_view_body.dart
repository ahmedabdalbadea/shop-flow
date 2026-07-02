import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/profile/view/widgets/total_orders.dart';
import 'package:shop_flow/features/profile/view/widgets/user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(title: "ShowFlow"),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(child: UserInfo()),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(child: Center(child: TotalOrders())),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
