import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/product_card_with_badge.dart';

class AllProductsSliverGrid extends StatelessWidget {
  const AllProductsSliverGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final Products productsList = BlocProvider.of<AllProductsCubit>(
      context,
    ).productsList!;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.21,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: productsList.products!.length,
        (context, index) {
          return ProductCardWithBadge(product: productsList.products![index]);
        },
      ),
    );
  }
}
