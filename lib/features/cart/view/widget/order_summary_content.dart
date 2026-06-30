import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrderSummaryContent extends StatelessWidget {
  const OrderSummaryContent({super.key, required this.orderSummaryItems});

  final List<({String title, String value})> orderSummaryItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: List.generate(
            orderSummaryItems.length,
            (index) => Text(
              orderSummaryItems[index].title,
              style: AppFontStyles.styleRegular14.copyWith(
                color: kThrTextColor,
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
            orderSummaryItems.length,
            (index) => Text(
              orderSummaryItems[index].value,
              style: AppFontStyles.styleRegular14.copyWith(
                color: kThrTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
