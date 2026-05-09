import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/featured_product_card.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: FeaturedProductCard(),
        );
      },
    );
  }
}
