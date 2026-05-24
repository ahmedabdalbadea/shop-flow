import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/home/view/widget/product_details_card.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

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
      slivers: [
        CustomSliverAppBar(title: "Shop Flow"),
        SliverToBoxAdapter(child: ProductImage(image: product.thumbnail)),

        SliverPadding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: ProductDetailsCard(product: product),
          ),
        ),
      ],
    );
  }
}
