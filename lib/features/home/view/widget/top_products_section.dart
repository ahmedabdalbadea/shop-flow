import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/home/view/widget/top_products_list_view.dart';
import 'package:shop_flow/features/wish_list/data/repos/wish_list_repo.dart';

class TopProductsSection extends StatelessWidget {
  const TopProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Top", style: AppFontStyles.styleSemiBold20),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 275,
          child: BlocProvider(
            create: (context) => WishListCubit(getIt.get<WishListRepo>()),
            child: const TopProductsListView(),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
