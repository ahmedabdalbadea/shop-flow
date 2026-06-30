import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.title, required this.itemsCount});
  final String title;
  final int itemsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppFontStyles.styleSemiBold24),
        Text(
          "$itemsCount Items",
          style: AppFontStyles.styleSemiBold14.copyWith(color: kThrTextColor),
        ),
      ],
    );
  }
}
