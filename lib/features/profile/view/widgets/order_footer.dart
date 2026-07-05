import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrderFooter extends StatelessWidget {
  const OrderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Total Amount: ", style: AppFontStyles.styleRegular16),
        Text("\$142.50", style: AppFontStyles.styleBold16),
      ],
    );
  }
}
