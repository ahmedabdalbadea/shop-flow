import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.title, this.selected = false});
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? kPrimaryColor : kPaddingColor,
      ),
      child: AnimatedDefaultTextStyle(
        style: AppFontStyles.styleSemiBold14.copyWith(
          color: selected ? Colors.white : const Color(0xff454652),
        ),
        duration: const Duration(milliseconds: 300),
        child: Text(title),
      ),
    );
  }
}
