import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/cart_product_details.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.title,
    required this.image,
    this.onPressed,
    required this.price,
    this.margin,
  });
  final String title, image;
  final VoidCallback? onPressed;
  final double price;
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
            SizedBox(width: 96, height: 96, child: ProductImage(image: image)),
            const SizedBox(width: 16),
            CartProductDetails(
              title: title,
              price: price,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
