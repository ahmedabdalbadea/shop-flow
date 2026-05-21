import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/recent_searches_list_view.dart';

class RecentSearchesSection extends StatelessWidget {
  const RecentSearchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<String>(kRecentSearchesBox).listenable(),
      builder: (context, box, _) {
        if (box.isEmpty) return const SizedBox.shrink();
        List<String> recentList = box.values.toList();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Searches", style: AppFontStyles.styleSemiBold20),
                GestureDetector(
                  onTap: () {
                    Hive.box<String>(kRecentSearchesBox).clear();
                  },
                  child: Text(
                    "Clear All",
                    style: AppFontStyles.styleRegular16.copyWith(
                      color: kSecTextColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: RecentSearchesListView(recentList: recentList),
            ),
          ],
        );
      },
    );
  }
}
