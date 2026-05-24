import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPaddingColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: kSecTextColor),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppFontStyles.styleRegular16.copyWith(height: 1.7),
          ),
          const SizedBox(height: 8),

          Text(
            subTitle,
            style: AppFontStyles.styleMedium12.copyWith(color: kThrTextColor),
          ),
        ],
      ),
    );
  }
}
