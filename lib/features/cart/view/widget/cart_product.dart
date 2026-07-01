import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/features/cart/view/widget/cart_product_details.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.product,
    this.onPressed,
    this.margin,
  });
  final ProductCartModel product;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: ProductImage(image: product.image),
            ),
            const SizedBox(width: 16),
            CartProductDetails(
              title: product.title,
              price: product.price,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
