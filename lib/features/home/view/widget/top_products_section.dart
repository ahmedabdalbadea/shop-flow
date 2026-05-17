import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/top_products_list_view.dart';
import 'package:shop_flow/features/home/view/widget/home_section_header.dart';

class TopProductsSection extends StatelessWidget {
  const TopProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(title: "Top"),
        const SizedBox(height: 16),

        SizedBox(height: 275, child: TopProductsListView()),
        const SizedBox(height: 28),
      ],
    );
  }
}
