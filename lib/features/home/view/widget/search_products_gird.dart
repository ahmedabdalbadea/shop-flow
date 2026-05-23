import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/data/models/products/products.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_error.dart';
import 'package:shop_flow/features/home/view/widget/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchProductsGrid extends StatelessWidget {
  const SearchProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, state) {
        if (state is SearchProductsSuccess ||
            state is SearchProductsByCategorySuccess) {
          return SearchProductsBodySucess(
            productsList: context.read<SearchProductsCubit>().productsList!,
          );
        } else if (state is SearchProductsFailure) {
          return CustomError(errMsg: state.errMsg);
        } else if (state is SearchProductsLoading ||
            state is SearchProductsByCategoryLoading) {
          return Skeletonizer.sliver(
            child: SearchProductsBodySucess(
              productsList: Products(
                products: List.generate(
                  10,
                  (index) => Product(title: "shoes", price: 19.19),
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: NoSearch());
        }
      },
    );
  }
}

class NoSearch extends StatelessWidget {
  const NoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.search, size: 56, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              "No search performed yet",
              textAlign: TextAlign.center,
              style: AppFontStyles.styleSemiBold18,
            ),
            SizedBox(height: 8),
            Text(
              "Type product name or category in the search bar above and press enter to see results.",
              textAlign: TextAlign.center,
              style: AppFontStyles.styleRegular16,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchProductsBodySucess extends StatelessWidget {
  const SearchProductsBodySucess({super.key, required this.productsList});
  final Products productsList;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.15,
      ),
      itemCount: productsList.products!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kProductDetailsView,
              extra: productsList.products![index],
            );
          },
          child: ProductCard(product: productsList.products![index]),
        );
      },
    );
  }
}
