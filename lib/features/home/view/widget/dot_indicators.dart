import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/dot_indicator_item.dart';

class DotIndicators extends StatelessWidget {
  const DotIndicators({
    super.key,
    required this.indicatorsCount,
    required this.imageIndex,
  });

  final int indicatorsCount;
  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(indicatorsCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: DotIndicatorItem(isActive: index == imageIndex),
        );
      }),
    );
  }
}
