import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrderTotalRow extends StatelessWidget {
  const OrderTotalRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: AppFontStyles.styleSemiBold14),
        Text(
          "\$667.44",
          style: AppFontStyles.styleSemiBold16.copyWith(color: kSecTextColor),
        ),
      ],
    );
  }
}
