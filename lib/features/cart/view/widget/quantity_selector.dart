import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/cart/view/widget/cart_icon_button.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key, required this.product});
  final ProductCartModel product;

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
              if (product.count > 1) {
                context.read<CartCubit>().decrementProductcount(product.id);
              }
            },
          ),
          const SizedBox(width: 16),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Text(
                product.count.toString(),
                style: AppFontStyles.styleSemiBold14,
              );
            },
          ),
          const SizedBox(width: 16),
          CartIconButton(
            icon: Icons.add,
            backgroundColor: kSecTextColor,
            iconColor: Colors.white,
            onPressed: () {
              context.read<CartCubit>().incrementProductcount(product.id);
            },
          ),
        ],
      ),
    );
  }
}
