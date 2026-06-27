import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class WishListHeader extends StatelessWidget {
  const WishListHeader({super.key, required this.itemsCount});
  final int itemsCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Wishlist", style: AppFontStyles.styleSemiBold24),
        const SizedBox(height: 4),
        Text(
          "You have $itemsCount items saved for later",
          style: AppFontStyles.styleRegular14.copyWith(color: kThrTextColor),
        ),
      ],
    );
  }
}
