import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/core/providers/user_provider.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/home/data/repos/home_repo_impl.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/manager/category_list_cubit/category_list_cubit.dart';
import 'package:shop_flow/features/home/manager/top_products_cubit/top_products_cubit.dart';
import 'package:shop_flow/features/home/manager/user_info_cubit/user_info_cubit.dart';
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
                TopProductsCubit(getIt.get<HomeRepoImpl>())..getTopProducts(),
          ),
          BlocProvider(
            create: (context) =>
                AllProductsCubit(getIt.get<HomeRepoImpl>())..getAllProducts(),
          ),

          BlocProvider(
            create: (context) =>
                CategoryListCubit(getIt.get<HomeRepoImpl>())
                  ..getCategoreyList(),
          ),

          BlocProvider(
            create: (context) => UserInfoCubit(getIt.get<HomeRepoImpl>())
              ..getUserInfo(
                uId: Provider.of<UserProvider>(
                  context,
                  listen: false,
                ).user!.uId,
              ),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
