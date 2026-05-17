import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_button.dart';

class TopProductCardInfo extends StatelessWidget {
  const TopProductCardInfo({
    super.key,
    required this.category,
    required this.title,
    required this.price,
    required this.onAddTap,
  });
  final String category;
  final String title;
  final String price;
  final VoidCallback onAddTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            category.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFontStyles.styleMedium12,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFontStyles.styleSemiBold14,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
                style: AppFontStyles.styleSemiBold20.copyWith(
                  color: kSecTextColor,
                ),
              ),
              CustomIconButton(onPressed: onAddTap),
            ],
          ),
        ],
      ),
    );
  }
}
