import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/home/view/widget/all_products_view_body.dart';
import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WishListCubit(getIt.get<WishListRepo>()),
          child: const AllProductsViewBody(),
        ),
      ),
    );
  }
}
