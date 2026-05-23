import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/recent_search_item.dart';

class RecentSearchesListView extends StatelessWidget {
  const RecentSearchesListView({super.key, required this.recentList});
  final List<String> recentList;
  @override
  Widget build(BuildContext context) {
    final SearchProductsCubit cubit = BlocProvider.of<SearchProductsCubit>(
      context,
    );
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: recentList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GestureDetector(
            onTap: () {
              cubit.searchFromRecent = true;
              cubit.searchBarController!.text = recentList[index];
              cubit.searchBarController!.selection = TextSelection.fromPosition(
                TextPosition(offset: recentList[index].length),
              );

              cubit.searchProducts(product: recentList[index]);
            },
            child: RecentSearchesItem(productName: recentList[index]),
          ),
        );
      },
    );
  }
}
