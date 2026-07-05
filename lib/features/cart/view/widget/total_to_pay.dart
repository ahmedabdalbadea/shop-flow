import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class TotalToPay extends StatelessWidget {
  const TotalToPay({super.key, required this.totalAmount});
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TOTAL TO PAY",
            style: AppFontStyles.styleMedium12.copyWith(color: kThrTextColor),
          ),
          const SizedBox(height: 4),
          Text(
            "\$${totalAmount.toStringAsFixed(8).replaceFirst(RegExp(r'0+$'), '')}",
            style: AppFontStyles.styleSemiBold24.copyWith(color: kSecTextColor),
          ),
        ],
      ),
    );
  }
}
