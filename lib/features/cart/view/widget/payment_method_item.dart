import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.perfixIcon,
    required this.title,
    this.isSelected = false,
  });
  final IconData perfixIcon;
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? kSecTextColor : kPrimaryBorderColor,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              perfixIcon,
              color: isSelected ? kSecTextColor : kThrTextColor,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),
          Text(
            title,
            style: AppFontStyles.styleSemiBold16.copyWith(
              color: isSelected ? kSecTextColor : null,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              isSelected
                  ? Icons.radio_button_checked_outlined
                  : Icons.radio_button_unchecked_outlined,
              color: isSelected ? kSecTextColor : kPrimaryBorderColor,
            ),
          ),
        ],
      ),
    );
  }
}
