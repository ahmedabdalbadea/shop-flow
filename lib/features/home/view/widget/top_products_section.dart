import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/top_products_list_view.dart';

class TopProductsSection extends StatelessWidget {
  const TopProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Top", style: AppFontStyles.styleSemiBold20),
        ),
        const SizedBox(height: 16),

        SizedBox(height: 275, child: TopProductsListView()),
        const SizedBox(height: 28),
      ],
    );
  }
}
