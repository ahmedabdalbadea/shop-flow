import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/show_snack_bar.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/profile/view/widgets/log_out_Item.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_items.dart';
import 'package:shop_flow/features/profile/view/widgets/total_orders.dart';
import 'package:shop_flow/features/profile/view/widgets/user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          context.go(AppRouter.kSignInView);
        } else if (state is LogOutFailure) {
          showSnackbar(
            context,
            title: state.errMsg,
            textColor: Colors.white,
            backgroundColor: kErrorColor,
          );
        }
      },
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(title: "ShowFlow"),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: UserInfo()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: Center(child: TotalOrders())),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ProfileItems(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  context.read<AuthCubit>().logOut();
                },
                child: LogOutItem(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
