import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/secondary_sliver_app_bar.dart';
import 'package:shop_flow/features/cart/view/widget/select_payment_method.dart';
import 'package:shop_flow/features/cart/view/widget/total_to_pay.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SecondarySliverAppBar(title: "Payment"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TotalToPay(totalAmount: 267.84),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SelectPaymentMethod(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
