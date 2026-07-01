import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/cart/view/widget/cart_product.dart';

class CartProductsSliverList extends StatelessWidget {
  const CartProductsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: context.read<CartCubit>().products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CartProduct(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                product: context.read<CartCubit>().products[index],
              ),
            );
          },
        );
      },
    );
  }
}
