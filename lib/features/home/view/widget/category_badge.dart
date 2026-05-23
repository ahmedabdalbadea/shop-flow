import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CategoryBadge extends StatelessWidget {
  const CategoryBadge({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: kPaddingColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        category[0].toUpperCase() + category.substring(1),
        style: AppFontStyles.styleBold10.copyWith(color: kSecTextColor),
      ),
    );
  }
}
