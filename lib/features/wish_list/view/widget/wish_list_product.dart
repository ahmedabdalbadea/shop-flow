import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/helpers/show_snack_bar.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';
import 'package:shop_flow/features/home/view/widget/category_badge.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_product_info.dart';

class WishListProduct extends StatelessWidget {
  const WishListProduct({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 115,
                child: ProductImage(image: product.thumbnail),
              ),
              WishListProductInfo(
                title: product.title ?? "UnKnown",
                price: product.price?.toString() ?? r"",
                onPressed: () {
                  context.read<CartCubit>().addProductToCart(
                    ProductCartModel.fromProduct(product),
                  );

                  showSnackbar(context, title: "Added to cart successfully");
                },
              ),
            ],
          ),
          Positioned(
            top: 115 - 20,
            left: 12,
            child: CategoryBadge(category: product.category ?? 'Unknown'),
          ),
        ],
      ),
    );
  }
}
