import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/manager/cart_cubit/cart_cubit.dart';

class OrderSummaryContent extends StatelessWidget {
  const OrderSummaryContent({super.key});
  final List<String> orderSummaryItems = const [
    "Subtotal",
    "Shipping",
    "Tax (8%)",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: List.generate(
            orderSummaryItems.length,
            (index) => Text(
              orderSummaryItems[index],
              style: AppFontStyles.styleRegular14.copyWith(
                color: kThrTextColor,
              ),
            ),
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  "\$${context.read<CartCubit>().calcTotalPrice().toStringAsFixed(2)}",
                  style: AppFontStyles.styleRegular14.copyWith(
                    color: kThrTextColor,
                  ),
                ),

                Text(
                  "Free",
                  style: AppFontStyles.styleRegular14.copyWith(
                    color: kThrTextColor,
                  ),
                ),

                Text(
                  "\$${context.read<CartCubit>().calcTax().toStringAsFixed(2)}",
                  style: AppFontStyles.styleRegular14.copyWith(
                    color: kThrTextColor,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
