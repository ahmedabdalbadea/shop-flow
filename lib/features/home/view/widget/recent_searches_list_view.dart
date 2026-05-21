import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/recent_search_item.dart';

class RecentSearchesListView extends StatelessWidget {
  const RecentSearchesListView({super.key, required this.recentList});
  final List<String> recentList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: recentList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RecentSearchesItem(productName: recentList[index]),
        );
      },
    );
  }
}
