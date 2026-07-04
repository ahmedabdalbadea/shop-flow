import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.perfixIcon,
    required this.title,
    this.perfixIconColor,
    this.textColor,
  });
  final IconData perfixIcon;
  final String title;
  final Color? perfixIconColor, textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              color: perfixIconColor ?? kSecTextColor,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),
          Text(
            title,
            style: AppFontStyles.styleRegular16.copyWith(color: textColor),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: kThrTextColor,
            size: 14,
          ),
        ],
      ),
    );
  }
}
