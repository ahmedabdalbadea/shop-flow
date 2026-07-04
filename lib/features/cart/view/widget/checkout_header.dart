import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Delivery Address", style: AppFontStyles.styleSemiBold16),

        Text(
          "STEP 1 OF 2",
          style: AppFontStyles.styleMedium12.copyWith(color: kSecTextColor),
        ),
      ],
    );
  }
}
