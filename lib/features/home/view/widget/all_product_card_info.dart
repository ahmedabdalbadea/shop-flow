import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class AllProductCardInfo extends StatelessWidget {
  const AllProductCardInfo({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFontStyles.styleSemiBold14,
          ),
          Text(
            "\$$price",
            style: AppFontStyles.styleSemiBold14.copyWith(color: kSecTextColor),
          ),
        ],
      ),
    );
  }
}
