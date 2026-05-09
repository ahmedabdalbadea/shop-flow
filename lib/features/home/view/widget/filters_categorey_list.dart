import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/filter_card.dart';

class FiltersCategoreyList extends StatefulWidget {
  const FiltersCategoreyList({super.key});

  @override
  State<FiltersCategoreyList> createState() => _FiltersCategoreyListState();
}

class _FiltersCategoreyListState extends State<FiltersCategoreyList> {
  final List<String> filtersList = ["All", "Top", "Featured", "Best Sellers"];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: filtersList.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () {
                if (e.key != selectedItem) {
                  setState(() {
                    selectedItem = e.key;
                  });
                }
              },
              child: FilterCard(
                title: e.value,
                selected: selectedItem == e.key,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
