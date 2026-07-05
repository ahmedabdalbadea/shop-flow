import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_item.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_items.dart';
import 'package:shop_flow/features/profile/view/widgets/total_orders.dart';
import 'package:shop_flow/features/profile/view/widgets/user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const CustomSliverAppBar(title: "ShowFlow"),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(child: UserInfo()),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(child: Center(child: TotalOrders())),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ProfileItems(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ProfileItem(
                perfixIcon: Icons.logout,
                title: "Logout",
                textColor: kErrorColor,
                perfixIconColor: kErrorColor,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
