import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(title: "ShowFlow"),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverToBoxAdapter(
          child: Center(
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadiusGeometry.circular(9999),
              child: Image.asset(Assets.userAvatar, width: 120, height: 120),
            ),
          ),
        ),
      ],
    );
  }
}
