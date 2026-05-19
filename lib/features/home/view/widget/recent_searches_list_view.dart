import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/recent_search_item.dart';

class RecentSearchesListView extends StatelessWidget {
  const RecentSearchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RecentSearchesItem(productName: "Running shoes"),
        );
      },
    );
  }
}
