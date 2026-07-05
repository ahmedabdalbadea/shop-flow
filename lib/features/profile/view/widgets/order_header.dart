import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("#SF-92834", style: AppFontStyles.styleRegular16),
      subtitle: const Text(
        "October 24, 2023",
        style: AppFontStyles.styleSemiBold16,
      ),

      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xffF0FDF4),
          border: Border.all(color: const Color(0xffDCFCE7)),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Text(
          "Delivered",
          style: AppFontStyles.styleBold16.copyWith(
            color: const Color(0xff15803D),
          ),
        ),
      ),
    );
  }
}
