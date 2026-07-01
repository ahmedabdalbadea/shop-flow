import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: () {
            context.read<CartCubit>().addProductToCart(
              ProductCartModel.fromProduct(product),
            );
          },
        ),
      ),
    );
  }
}
