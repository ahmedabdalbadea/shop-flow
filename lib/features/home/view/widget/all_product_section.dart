import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/view/widget/all_product_card.dart';
import 'package:shop_flow/features/home/view/widget/home_section_header.dart';

class AllProductSection extends StatelessWidget {
  const AllProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeSectionHeader(title: "All Products"),
              const SizedBox(height: 16),
            ],
          ),
        ),

        SliverPadding(
          padding: EdgeInsetsGeometry.only(right: 24),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1 / 1.10,
            children: List.generate(
              4,
              (index) => AllProductCard(
                image: Assets.imagesFeaturedImageTest,
                title: "Retro Cam Mini",
                price: "89.00",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
