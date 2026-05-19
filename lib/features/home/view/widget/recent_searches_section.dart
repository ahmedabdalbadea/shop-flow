import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/recent_searches_list_view.dart';

class RecentSearchesSection extends StatelessWidget {
  const RecentSearchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
