import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/core/utils/assets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: const Color.fromARGB(59, 241, 245, 249),
      elevation: 4,
      forceElevated: true,
      titleSpacing: 24,
      title: Text(
        title,
        style: AppFontStyles.styleBold20.copyWith(color: kPrimaryColor),
      ),
      actionsPadding: EdgeInsets.only(right: 24),
      actions: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.go(AppRouter.kCartView);
              },
              child: Badge(
                label: Text("${context.read<CartCubit>().products.length}"),
                backgroundColor: const Color(0xFF2E7D32),
                child: SvgPicture.asset(Assets.imageBag),
              ),
            );
          },
        ),
      ],
    );
  }
}
