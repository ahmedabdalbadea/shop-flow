import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/widget/filter_card.dart';

class OrdersFilter extends StatefulWidget {
  const OrdersFilter({super.key});

  @override
  State<OrdersFilter> createState() => _OrdersFilterState();
}

class _OrdersFilterState extends State<OrdersFilter> {
  final List<String> _statusList = const [
    'All Orders',
    'Processing',
    'Delivered',
    'Cancelled',
  ];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: List.generate(_statusList.length, (index) {
          return GestureDetector(
            onTap: () {
              if (selectedItem != index) {
                setState(() {
                  selectedItem = index;
                });
                context.read<OrderCubit>().fetchOrders(
                  uId: Provider.of<UserProvider>(
                    context,
                    listen: false,
                  ).user!.uId,
                  filter: index == 0 ? null : _statusList[index],
                );
              }
            },
            child: FilterCard(
              title: _statusList[index],
              selected: selectedItem == index,
            ),
          );
        }),
      ),
    );
  }
}
