import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/cart/data/cart_local_data_source.dart';
import 'package:shop_flow/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/view/add_to_cart_button.dart';
import 'package:shop_flow/features/home/view/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartLocalDataSource()),
      child: Scaffold(
        body: SafeArea(child: ProductDetailsViewBody(product: product)),
        bottomNavigationBar: AddToCartButton(product: product),
      ),
    );
  }
}
