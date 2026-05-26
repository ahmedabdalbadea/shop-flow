import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class ProductDetailsPrice extends StatelessWidget {
  const ProductDetailsPrice({
    super.key,
    required this.price,
    this.discountPercentage,
  });
  final double price;
  final double? discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$$price",
          style: AppFontStyles.styleSemiBold24.copyWith(color: kSecTextColor),
        ),

        const SizedBox(width: 12),

        if (discountPercentage != null && discountPercentage != 0.0) ...[
          Text(
            r"$" +
                (price / (1 - (discountPercentage! / 100))).toStringAsFixed(2),
            style: AppFontStyles.styleRegular14.copyWith(
              color: kThrTextColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xffFFDAD6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${discountPercentage!.toStringAsFixed(2)}% OFF",
              style: AppFontStyles.styleBold10.copyWith(
                color: const Color(0xff93000A),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
