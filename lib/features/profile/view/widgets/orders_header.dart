import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("My Orders", style: AppFontStyles.styleRegular16),
        const SizedBox(height: 8),
        Text(
          "Track and manage your recent purchases.",
          style: AppFontStyles.styleRegular16.copyWith(color: kThrTextColor),
        ),
      ],
    );
  }
}
