import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
        overscroll: false,
      ),
      slivers: [CustomSliverAppBar(title: "Shop Flow")],
    );
  }
}
