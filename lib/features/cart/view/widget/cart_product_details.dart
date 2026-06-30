import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/view/widget/cart_icon_button.dart';
import 'package:shop_flow/features/cart/view/widget/quantity_selector.dart';

class CartProductDetails extends StatelessWidget {
  const CartProductDetails({
    super.key,
    required this.title,
    required this.onPressed,
    required this.price,
  });

  final String title;
  final VoidCallback? onPressed;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppFontStyles.styleSemiBold14),
              CartIconButton(
                icon: Icons.delete_outlined,
                iconSize: 24,
                padding: EdgeInsets.all(0),
              ),
            ],
          ),
          Text(
            "Size: 42 • Red",
            style: AppFontStyles.styleRegular14.copyWith(color: kThrTextColor),
          ),

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: AppFontStyles.styleSemiBold20.copyWith(
                  color: kSecTextColor,
                ),
              ),

              const QuantitySelector(),
            ],
          ),
        ],
      ),
    );
  }
}
