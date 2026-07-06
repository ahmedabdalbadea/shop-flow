import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/manager/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/home/data/repos/home_repo_impl.dart';
import 'package:shop_flow/features/profile/data/repos/profile_repo.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserInfoCubit(getIt.get<HomeRepoImpl>())
                ..getUserInfo(
                  uId: Provider.of<UserProvider>(
                    context,
                    listen: false,
                  ).user!.uId,
                ),
            ),
            BlocProvider(
              create: (context) => OrderCubit(getIt.get<ProfileRepo>())
                ..fetchOrders(
                  uId: Provider.of<UserProvider>(
                    context,
                    listen: false,
                  ).user!.uId,
                ),
            ),
          ],
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
