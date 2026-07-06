import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TotalOrders extends StatelessWidget {
  const TotalOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kPrimaryBorderColor),
      ),
      child: Column(
        children: [
          Text(
            "TOTAL ORDERS",
            style: AppFontStyles.styleRegular16.copyWith(color: kThrTextColor),
          ),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is OrdersSuccess) {
                return Text(
                  state.orders.length.toString(),
                  style: AppFontStyles.styleRegular16.copyWith(
                    color: kSecTextColor,
                  ),
                );
              }

              if (state is OrdersFailure) {
                return Text(
                  'Unknown',
                  style: AppFontStyles.styleRegular16.copyWith(
                    color: kSecTextColor,
                  ),
                );
              }

              return Skeletonizer(
                child: Text(
                  '24',
                  style: AppFontStyles.styleRegular16.copyWith(
                    color: kSecTextColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
