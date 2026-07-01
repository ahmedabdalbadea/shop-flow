import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/show_snack_bar.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/home/manager/top_products_cubit/top_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_error.dart';
import 'package:shop_flow/features/home/view/widget/custom_top_products_loading.dart';
import 'package:shop_flow/features/home/view/widget/top_product_card.dart';

class TopProductsListView extends StatelessWidget {
  const TopProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishListCubit, WishListState>(
      listener: (context, state) {
        if (state is WishListAddingSuccess) {
          showSnackbar(context, title: 'Added to Wishlist successfully!');
        }
        if (state is WishListAddingFailure) {
          showSnackbar(
            context,
            title: state.errMsg,
            backgroundColor: kErrorColor,
            textColor: Colors.white,
          );
        }
      },
      child: BlocBuilder<TopProductsCubit, TopProductsState>(
        builder: (context, state) {
          if (state is TopProductsSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.products!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kProductDetailsView,
                        extra: state.products.products![index],
                      );
                    },
                    child: TopProductCard(
                      product: state.products.products![index],
                      onAddTap: () {
                        context.read<WishListCubit>().addProductToWishList(
                          uId: Provider.of<UserProvider>(
                            context,
                            listen: false,
                          ).user!.uId,
                          product: state.products.products![index],
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is TopProductsFailure) {
            return CustomError(errMsg: state.errMsg);
          } else {
            return const CustomTopProductsLoading();
          }
        },
      ),
    );
  }
}
