import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/features/profile/view/widgets/order_sliver_list_content.dart';
import 'package:shop_flow/features/profile/view/widgets/orders_sliver_list_loading.dart';

class OrderSliverList extends StatelessWidget {
  const OrderSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrdersSuccess) {
          if (state.orders.isEmpty) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text("You don't have any orders yet.")),
            );
          }
          return OrderSliverListContent(orders: state.orders);
        } else if (state is OrdersFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(state.errMsg)),
          );
        }
        return const OrdersSliverListLoading();
      },
    );
  }
}
