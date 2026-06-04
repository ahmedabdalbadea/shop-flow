import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/home/manager/category_list_cubit/category_list_cubit.dart';
import 'package:shop_flow/features/home/view/widget/all_product_section.dart';
import 'package:shop_flow/features/home/view/widget/custom_search_bar.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/home/view/widget/top_products_section.dart';
import 'package:shop_flow/features/home/view/widget/filters_categorey_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(
        overscroll: false,
        physics: BouncingScrollPhysics(),
      ),
      slivers: [
        CustomSliverAppBar(title: "ShopFlow"),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: Padding(
            padding: _buildPadding(),
            child: Text(
              "Hello, Julian",
              style: AppFontStyles.styleSemiBold14.copyWith(
                color: kThrTextColor,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: _buildPadding(),
            child: Text(
              "Discover your style",
              style: AppFontStyles.styleSemiBold24,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Hero(
              tag: "search_bar",
              child: Material(
                color: Colors.transparent,
                child: CustomSearchBar(
                  readOnly: true,
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kSearchView,
                      extra: context.read<CategoryListCubit>(),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: _buildPadding(),
            child: FiltersCategoreyList(fromHome: true),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: Padding(padding: _buildPadding(), child: TopProductsSection()),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 32)),
        SliverPadding(padding: _buildPadding(), sliver: AllProductSection()),
        SliverToBoxAdapter(child: const SizedBox(height: 55)),
      ],
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.symmetric(horizontal: 24.0);
}
