import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class TotalOrders extends StatelessWidget {
  const TotalOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kPrimaryBorderColor),
      ),
      child: Column(
        children: [
          Text(
            "TOTAL ORDERS",
            style: AppFontStyles.styleRegular16.copyWith(color: kThrTextColor),
          ),
          Text(
            "24",
            style: AppFontStyles.styleRegular16.copyWith(color: kSecTextColor),
          ),
        ],
      ),
    );
  }
}
