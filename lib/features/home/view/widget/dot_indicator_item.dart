import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';

class DotIndicatorItem extends StatelessWidget {
  const DotIndicatorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 18 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.blueGrey,
        borderRadius: BorderRadius.circular(9999),
      ),
    );
  }
}
