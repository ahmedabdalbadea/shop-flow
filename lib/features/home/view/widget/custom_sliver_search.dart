import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_search_bar.dart';

class CustomSliverSearchBar extends StatefulWidget {
  const CustomSliverSearchBar({super.key});

  @override
  State<CustomSliverSearchBar> createState() => _CustomSliverSearchBarState();
}

class _CustomSliverSearchBarState extends State<CustomSliverSearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchProductsCubit cubit = BlocProvider.of<SearchProductsCubit>(
      context,
    );

    cubit.searchBarController = _textEditingController;
    return SliverAppBar(
      pinned: true,
      floating: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: const Color.fromARGB(59, 241, 245, 249),
      elevation: 4,
      forceElevated: true,
      title: Hero(
        tag: "search_bar",
        child: Material(
          color: Colors.transparent,
          child: CustomSearchBar(
            controller: _textEditingController,
            onChanged: (value) {
              cubit.searchProducts(product: value);
              cubit.searchFromRecent = false;
            },
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                Hive.box<String>(kRecentSearchesBox).add(value);
              }
            },
          ),
        ),
      ),

      titleSpacing: 8,
      foregroundColor: kSecTextColor,
    );
  }
}
