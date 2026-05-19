import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/filters_categorey_list.dart';
import 'package:shop_flow/features/home/view/widget/recent_searches_list_view.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent Searches", style: AppFontStyles.styleSemiBold20),
              Text(
                "Clear All",
                style: AppFontStyles.styleRegular16.copyWith(
                  color: kSecTextColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 100, child: RecentSearchesListView()),
        ],
      ),
    );
  }
}
