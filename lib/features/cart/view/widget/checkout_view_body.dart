import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/view/widget/checkout_sliver_app_bar.dart';
import 'package:shop_flow/features/cart/view/widget/order_summary.dart';
import 'package:shop_flow/features/cart/view/widget/shipping_address_form.dart';
import 'package:shop_flow/features/cart/view/widget/stripe_security_notice.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CheckoutSliverAppBar(title: "Checkout"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Delivery Address",
              style: AppFontStyles.styleSemiBold16,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ShippingAddressForm(),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),

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
            child: StripeSecurityNotice(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
