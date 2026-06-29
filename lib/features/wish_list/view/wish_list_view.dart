import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WishListCubit(getIt.get<WishListRepo>())
          ..getWishListProducts(
            uId: Provider.of<UserProvider>(context, listen: false).user!.uId,
          ),
        child: const WishListViewBody(),
      ),
    );
  }
}
