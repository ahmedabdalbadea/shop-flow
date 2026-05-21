import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_search_bar.dart';

class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: const Color.fromARGB(59, 241, 245, 249),
      elevation: 4,
      forceElevated: true,
      title: CustomSearchBar(
        onChanged: (value) {
          BlocProvider.of<SearchProductsCubit>(
            context,
          ).searchProducts(product: value);
        },
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Hive.box<String>(kRecentSearchesBox).add(value);
          }
        },
      ),

      titleSpacing: 8,
      foregroundColor: kSecTextColor,
    );
  }
}
