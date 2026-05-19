import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class RecentSearchesItem extends StatelessWidget {
  const RecentSearchesItem({super.key, required this.productName});
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.history, color: Color(0xff94A3B8)),
        const SizedBox(width: 12),
        Text(productName, style: AppFontStyles.styleRegular16),
        Spacer(),
        const Icon(Icons.north_west, color: Color(0xff94A3B8)),
      ],
    );
  }
}
