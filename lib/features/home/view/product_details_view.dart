import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';
import 'package:shop_flow/features/home/view/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody(product: product)),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: SizedBox(
          height: 56,
          child: CustomIconElevatedButton(
            label: "Add to Cart",
            icon: Icons.shopping_cart_outlined,
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
