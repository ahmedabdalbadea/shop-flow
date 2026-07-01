import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/cart/view/widget/cart_header.dart';
import 'package:shop_flow/features/cart/view/widget/cart_products_sliver_list.dart';
import 'package:shop_flow/features/cart/view/widget/order_summary.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key, required this.productsCount});

  final int productsCount;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CartHeader(title: "Your Cart", itemsCount: productsCount),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const CartProductsSliverList(),
        const SliverToBoxAdapter(child: SizedBox(height: 24 - 8)),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: OrderSummary(),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 56,
              child: CustomIconElevatedButton(
                icon: Icons.lock,
                label: "Proceed to Checkout",
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  context.push(AppRouter.kCheckoutView);
                },
                radius: 12,
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
