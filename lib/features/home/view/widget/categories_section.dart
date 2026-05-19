import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/filters_categorey_list.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Categories", style: AppFontStyles.styleSemiBold20),
        const SizedBox(height: 8),
        FiltersCategoreyList(),
      ],
    );
  }
}
