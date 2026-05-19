import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/categories_section.dart';
import 'package:shop_flow/features/home/view/widget/recent_searches_section.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          RecentSearchesSection(),

          const SizedBox(height: 32),
          CategoriesSection(),
        ],
      ),
    );
  }
}
