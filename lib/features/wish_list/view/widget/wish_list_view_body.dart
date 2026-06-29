import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_failure_sliver.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_success_sliver.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "ShopFlow"),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            if (state is WishListSuccess) {
              return WishListSuccessSliver(products: state.products);
            } else if (state is WishListFailure) {
              return WishListFailureSliver(errMsg: state.errMsg);
            }
            return Skeletonizer.sliver(
              child: WishListSuccessSliver(
                products: List.generate(4, (index) => Product(price: 11.11)),
              ),
            );
          },
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
