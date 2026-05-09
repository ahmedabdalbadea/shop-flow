import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/all_product_section.dart';
import 'package:shop_flow/features/home/view/widget/custom_search_bar.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/home/view/widget/featured_section.dart';
import 'package:shop_flow/features/home/view/widget/filters_categorey_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(),
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
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomSearchBar(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: _buildPadding(),
            child: FiltersCategoreyList(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: Padding(padding: _buildPadding(), child: FeaturedSection()),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 32)),
        SliverPadding(padding: _buildPadding(), sliver: AllProductSection()),
        SliverToBoxAdapter(child: const SizedBox(height: 55)),
      ],
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.symmetric(horizontal: 24.0);
}
