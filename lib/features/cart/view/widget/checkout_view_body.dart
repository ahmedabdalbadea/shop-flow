import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/checkout_header.dart';
import 'package:shop_flow/features/cart/view/widget/secondary_sliver_app_bar.dart';
import 'package:shop_flow/features/cart/view/widget/order_summary.dart';
import 'package:shop_flow/features/cart/view/widget/shipping_address_form.dart';
import 'package:shop_flow/features/cart/view/widget/stripe_security_notice.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required AutovalidateMode autovalidateMode,
  }) : _autovalidateMode = autovalidateMode,
       _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  final AutovalidateMode _autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SecondarySliverAppBar(title: "Checkout"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CheckoutHeader(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ShippingAddressForm(
              formKey: _formKey,
              autovalidateMode: _autovalidateMode,
            ),
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
