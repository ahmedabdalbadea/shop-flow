import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_button.dart';

class ProductCardWithBadgeInfo extends StatelessWidget {
  const ProductCardWithBadgeInfo({
    super.key,
    required this.title,
    required this.price,
  });
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFontStyles.styleBold16,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
                style: AppFontStyles.styleRegular18.copyWith(
                  color: kSecTextColor,
                ),
              ),
              CustomIconButton(size: 24, radius: 999, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
