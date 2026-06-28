import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/show_snack_bar.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/core/models/products/products.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/product_card_with_badge.dart';

class AllProductsSliverGrid extends StatelessWidget {
  const AllProductsSliverGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final Products productsList = BlocProvider.of<AllProductsCubit>(
      context,
    ).productsList!;
    return BlocListener<WishListCubit, WishListState>(
      listener: (context, state) {
        if (state is WishListAddingSuccess) {
          showSnackbar(
            context,
            title: 'Product added to Wishlist successfully!',
          );
        }
        if (state is WishListAddingFailure) {
          showSnackbar(
            context,
            title: state.errMsg,
            backgroundColor: kErrorColor,
          );
        }
      },
      child: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1 / 1.21,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: productsList.products!.length,
          (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kProductDetailsView,
                  extra: productsList.products![index],
                );
              },
              child: ProductCardWithBadge(
                product: productsList.products![index],
                onPressed: () {
                  context.read<WishListCubit>().addProductToWishList(
                    uId: Provider.of<UserProvider>(
                      context,
                      listen: false,
                    ).user!.uId,
                    product: productsList.products![index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
