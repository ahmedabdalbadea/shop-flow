import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/view/widget/cart_icon_button.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int itemsCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      decoration: BoxDecoration(
        color: const Color(0xffEFEDF6),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        children: [
          CartIconButton(
            icon: Icons.remove,
            backgroundColor: Colors.white,
            onPressed: () {
              if (itemsCount > 1) {
                setState(() {
                  itemsCount--;
                });
              }
            },
          ),
          const SizedBox(width: 16),
          Text(itemsCount.toString(), style: AppFontStyles.styleSemiBold14),
          const SizedBox(width: 16),
          CartIconButton(
            icon: Icons.add,
            backgroundColor: kSecTextColor,
            iconColor: Colors.white,
            onPressed: () {
              setState(() {
                itemsCount++;
              });
            },
          ),
        ],
      ),
    );
  }
}
