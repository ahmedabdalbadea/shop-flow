import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/cart/view/widget/cart_products_sliver_list.dart';
import 'package:shop_flow/features/cart/view/widget/cart_header.dart';
import 'package:shop_flow/features/cart/view/widget/order_summary.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Shop Flow"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CartHeader(title: "Your Cart", itemsCount: 3),
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
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 56,
              child: CustomIconElevatedButton(
                icon: Icons.lock,
                label: "Proceed to Checkout",
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                radius: 12,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 56,
              child: CustomElevatedButton(
                title: "Continue Shopping",
                onPressed: () {},
                foregroundColor: kPrimaryColor,
                borderWidth: 2,
                borderColor: kPrimaryColor,
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
