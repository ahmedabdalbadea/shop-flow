import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/featured_list_view.dart';
import 'package:shop_flow/features/home/view/widget/home_section_header.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(title: "Featured"),
        const SizedBox(height: 16),

        SizedBox(height: 275, child: FeaturedListView()),
        const SizedBox(height: 28),
      ],
    );
  }
}
