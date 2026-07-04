import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/secondary_sliver_app_bar.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SecondarySliverAppBar(title: "Payment"),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
