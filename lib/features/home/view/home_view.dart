import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/api_service.dart';
import 'package:shop_flow/features/home/data/repos/home_repo_impl.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/manager/top_products_cubit/top_products_cubit.dart';
import 'package:shop_flow/features/home/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TopProductsCubit(HomeRepoImpl(ApiService(Dio())))
                  ..getTopProducts(),
          ),
          BlocProvider(
            create: (context) =>
                AllProductsCubit(HomeRepoImpl(ApiService(Dio())))
                  ..getAllProducts(),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
