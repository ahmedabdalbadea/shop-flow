import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';

class OrderTotalRow extends StatelessWidget {
  const OrderTotalRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: AppFontStyles.styleSemiBold14),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Text(
              "\$${context.read<CartCubit>().calcTotalPriceWithTax().toStringAsFixed(2)}",
              style: AppFontStyles.styleSemiBold16.copyWith(
                color: kSecTextColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
