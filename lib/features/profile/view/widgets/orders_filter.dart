import 'package:flutter/material.dart';
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
              setState(() {
                selectedItem = index;
              });
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
