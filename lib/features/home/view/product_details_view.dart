import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/home/view/add_to_cart_button.dart';
import 'package:shop_flow/features/home/view/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody(product: product)),
      bottomNavigationBar: AddToCartButton(product: product),
    );
  }
}
