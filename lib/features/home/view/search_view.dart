import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/home/data/repos/home_repo_impl.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchProductsCubit(getIt.get<HomeRepoImpl>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
