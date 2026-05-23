import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/product_card.dart';
import 'package:shop_flow/features/home/view/widget/custom_all_product_loading.dart';
import 'package:shop_flow/features/home/view/widget/custom_error.dart';

class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsSuccess) {
          final Products productsList = BlocProvider.of<AllProductsCubit>(
            context,
          ).productsList!;
          return SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1 / 1.15,
            children: List.generate(
              4,
              (index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kProductDetailsView,
                    extra: productsList.products![index],
                  );
                },
                child: ProductCard(product: productsList.products![index]),
              ),
            ),
          );
        } else if (state is AllProductsFailure) {
          return SliverToBoxAdapter(child: CustomError(errMsg: state.errMsg));
        } else {
          return CustomAllProductLoading();
        }
      },
    );
  }
}
