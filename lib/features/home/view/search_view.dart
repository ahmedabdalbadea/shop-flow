import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SearchViewBody()));
  }
}
