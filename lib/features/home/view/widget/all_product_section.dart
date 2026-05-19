import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/all_product_grid.dart';
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

        AllProductsGrid(),
      ],
    );
  }
}
