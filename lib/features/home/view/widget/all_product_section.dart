import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/all_product_grid.dart';

class AllProductSection extends StatelessWidget {
  const AllProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products", style: AppFontStyles.styleSemiBold20),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kAllProductsView,
                        extra: context.read<AllProductsCubit>(),
                      );
                    },
                    child: Text(
                      "View all",
                      style: AppFontStyles.styleSemiBold14.copyWith(
                        color: kSecTextColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),

        AllProductsGrid(),
      ],
    );
  }
}
