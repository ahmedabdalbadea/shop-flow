import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/categories_section.dart';
import 'package:shop_flow/features/home/view/widget/search_products_gird.dart';
import 'package:shop_flow/features/home/view/widget/recent_searches_section.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          const SliverToBoxAdapter(
            child: Column(
              children: [
                RecentSearchesSection(),

                SizedBox(height: 32),
                CategoriesSection(),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SearchProductsGrid(),
          const SliverToBoxAdapter(child: SizedBox(height: 34)),
        ],
      ),
    );
  }
}
