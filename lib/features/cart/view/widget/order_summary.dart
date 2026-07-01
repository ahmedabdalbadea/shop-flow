import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/view/widget/order_summary_content.dart';
import 'package:shop_flow/features/cart/view/widget/order_total_row.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kFillColor,
        border: Border.all(color: kPrimaryBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Order Summary", style: AppFontStyles.styleSemiBold14),
          ),
          const SizedBox(height: 8),
          const OrderSummaryContent(),
          const Divider(color: kPrimaryBorderColor, height: 17),
          OrderTotalRow(),
        ],
      ),
    );
  }
}
