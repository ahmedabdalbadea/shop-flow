import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/cart/view/widget/cart_content.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Shop Flow"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            List<ProductCartModel> products = context
                .read<CartCubit>()
                .products;
            if (products.isNotEmpty) {
              return CartContent(productsCount: products.length);
            } else {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    "No Products In Your Cart",
                    style: AppFontStyles.styleRegular16.copyWith(
                      color: kThrTextColor,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
