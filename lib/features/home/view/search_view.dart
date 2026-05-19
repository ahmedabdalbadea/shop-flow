import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/view/widget/custom_search_bar.dart';
import 'package:shop_flow/features/home/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(59, 241, 245, 249),
        elevation: 4,
        title: CustomSearchBar(),
        titleSpacing: 8,
        foregroundColor: kSecTextColor,
      ),
      body: const SafeArea(child: SearchViewBody()),
    );
  }
}
